import { QuartzFilterPlugin } from "../quartz/plugins/types"

export const FilterCustom: QuartzFilterPlugin<{}> = () => ({
  name: "FilterCustom",
  shouldPublish(_ctx, [_tree, vfile]) {
    const draftFlag: boolean =
      vfile.data?.frontmatter?.tag !== 'prod'
    return !draftFlag
  },
})
