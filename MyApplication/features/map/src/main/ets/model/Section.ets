export interface KnowledgeBaseItem {
  type: string,
  title: string
}

export interface Material {
  subtitle: string,
  items: KnowledgeBaseItem[]
}

export interface Section {
  title: string,
  brief: string,
  materials: Material[]
}

export const TypeMapIcon: Record<string, string> = {
  '指南': 'app.media.ic_guide',
  '准备': 'app.media.ic_prepare',
  '学习与获取证书': 'app.media.ic_medals',
  '视频教程': 'app.media.ic_video',
}