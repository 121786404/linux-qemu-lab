#ifndef _LINUX_SLAB_DEF_H
#define	_LINUX_SLAB_DEF_H

#include <linux/reciprocal_div.h>

/*
 * Definitions unique to the original Linux SLAB allocator.
 */

/**
 * slab������������
 */
struct kmem_cache {
	/**
	 * Ϊÿ��CPU�������ʱ���󣬿��Լӿ�ÿ��CPU�ϵķ������
	 * �����ڻ��ϵͳ�е�PCP
	 */
	struct array_cache __percpu *cpu_cache;

/* 1) Cache tunables. Protected by slab_mutex */
	/**
	 * ��slab_mutex����
	 * batchcountһ�����򻺴�����Ӷ��ٸ�����
	 * limit���������������
	 */
	unsigned int batchcount;
	unsigned int limit;
	unsigned int shared;

	//slabͷ����С??
	unsigned int size;
	//�ӿ��ڲ���������õ���ʱ����
	struct reciprocal_value reciprocal_buffer_size;
/* 2) touched by every alloc & free from the backend */

	//slab�������ԣ���CFLGS_OFF_SLAB
	unsigned int flags;		/* constant flags */
	//ÿ��slab�еĶ������
	unsigned int num;		/* # of objs per slab */

/* 3) cache_grow/shrink */
	/* order of pgs per slab (2^n) */
	//�����������slabʱ����������ͷŵ��ڴ�order��
	unsigned int gfporder;

	/* force GFP flags, e.g. GFP_DMA */
	//�����ڴ��GFP��־���������ϲ���÷�ʽ��
	gfp_t allocflags;

	//��ɫ��Χ��
	size_t colour;			/* cache colouring range */
	//������ɫ֮��Ĳ�
	unsigned int colour_off;	/* colour offset */
	//��kmem_cacheλ��slab����ʱ��Ԥ�ȷ����kmem_cache����ָ�뼰��������
	struct kmem_cache *freelist_cache;
	unsigned int freelist_size;

	/* constructor func */
	//����slabʱ�Ļص�
	void (*ctor)(void *obj);

/* 4) cache creation/removal */
	//��ʾ��proc/slabinfo�е�����
	const char *name;
	//ͨ�����ֶν��������ӵ�cache_chain����
	struct list_head list;
	//���ü���
	int refcount;
	//slab�����С
	int object_size;
	int align;

/* 5) statistics */
#ifdef CONFIG_DEBUG_SLAB
	unsigned long num_active;
	unsigned long num_allocations;
	unsigned long high_mark;
	unsigned long grown;
	unsigned long reaped;
	unsigned long errors;
	unsigned long max_freeable;
	unsigned long node_allocs;
	unsigned long node_frees;
	unsigned long node_overflow;
	atomic_t allochit;
	atomic_t allocmiss;
	atomic_t freehit;
	atomic_t freemiss;
#ifdef CONFIG_DEBUG_SLAB_LEAK
	atomic_t store_user_clean;
#endif

	/*
	 * If debugging is enabled, then the allocator can add additional
	 * fields and/or padding to every object. size contains the total
	 * object size including these internal fields, the following two
	 * variables contain the offset to the user object and its size.
	 */
	int obj_offset;
#endif /* CONFIG_DEBUG_SLAB */

#ifdef CONFIG_MEMCG
	struct memcg_cache_params memcg_params;
#endif
#ifdef CONFIG_KASAN
	struct kasan_cache kasan_info;
#endif

#ifdef CONFIG_SLAB_FREELIST_RANDOM
	unsigned int *random_seq;
#endif

	struct kmem_cache_node *node[MAX_NUMNODES];
};

static inline void *nearest_obj(struct kmem_cache *cache, struct page *page,
				void *x)
{
	void *object = x - (x - page->s_mem) % cache->size;
	void *last_object = page->s_mem + (cache->num - 1) * cache->size;

	if (unlikely(object > last_object))
		return last_object;
	else
		return object;
}

#endif	/* _LINUX_SLAB_DEF_H */
