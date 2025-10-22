import { defineCollection, z } from 'astro:content';

const blogCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string(),
    publishDate: z.date(),
    author: z.string().default("Barry \"Boomer\" Brown"),
    readTime: z.string(),
    featuredImage: z.string(),
    category: z.string(),
    tags: z.array(z.string()),
    featured: z.boolean().default(false),
    draft: z.boolean().default(false),
    seo: z.object({
      title: z.string(),
      description: z.string(),
      keywords: z.string(),
    }),
  }),
});

export const collections = {
  'blog': blogCollection,
};
