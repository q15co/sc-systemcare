import { defineCollection, z } from "astro:content";

const ratgeberCollection = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string().min(5),
    published: z.boolean(),
  }),
});

export const collections = {
  ratgeber: ratgeberCollection,
};
