import { CourseLearning } from 'learning'
import { KnowledgeMap, KnowledgeMapContent } from 'map'
import { QuickStartPage } from 'quickstart'

@Entry
@Component
struct Index {
  @State selectedIndex: number = 0
  private tabsController : TabsController = new TabsController();

  @Builder
  tabBarBuilder(title: string, index: number, selectedIcon: Resource, unselectedIcon: Resource) {
    Column() {
      Image(this.selectedIndex === index ? selectedIcon : unselectedIcon)
        .width(24)
        .height(24)
      Text(title)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontSize(10)
        .fontColor(this.selectedIndex === index ? '#0A59F7' : 'rgba(0,0,0,0.60)')
        .textAlign(TextAlign.Center)
        .lineHeight(14)
        .fontWeight(500)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.selectedIndex = index;
      this.tabsController.changeIndex(index);
    })
  }

  build() {

    Tabs({ barPosition: BarPosition.End, controller: this.tabsController}) {
      TabContent() {
        QuickStartPage()
      }
      .tabBar(this.tabBarBuilder('快速入门', 0, $r('app.media.ic_01_on'), $r('app.media.ic_01_off')))

      TabContent() {
        CourseLearning()
      }
      .tabBar(this.tabBarBuilder('课程学习', 1, $r('app.media.ic_02_on'), $r('app.media.ic_02_off')))

      TabContent() {
        KnowledgeMap()
      }
      .tabBar(this.tabBarBuilder('知识地图', 2, $r('app.media.ic_03_on'), $r('app.media.ic_03_off')))
    }
    .scrollable(false)
    .vertical(false)
    .divider({
      strokeWidth: 0.5,
      color: '#0D182431'
    })
    .backgroundColor(Color.White)
  }
}