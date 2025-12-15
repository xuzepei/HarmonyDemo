import { NavBarItemType } from "../model/NavBarItemType"

@Component
export struct NavBarItem {
  @Consume pathStack: NavPathStack;
  @Prop item: NavBarItemType;

  @Link currentNavBarIndex: number;

  build() {
    Row() {
      Text(this.item.order)
        .margin({ right: 6 })
        .fontFamily('HarmonyHeiTi-Bold')
        .fontSize(21)
        .fontColor('#182431')
        .textAlign(TextAlign.Start)
        .lineHeight(22)
        .fontWeight(700)

      Text(this.item.title)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontSize(16)
        .fontColor('#182431')
        .textAlign(TextAlign.Start)
        .lineHeight(22)
        .fontWeight(500)

      Blank()
      Image($r('app.media.ic_arrow'))
        .width(12)
        .height(14)
    }
    .width('100%')
    .height(48)
    .borderRadius(16)
    .alignItems(VerticalAlign.Center)
    .padding({ left: 12, right: 12 })
    .backgroundColor('#F1F3F5')
    .backgroundColor(
      this.currentNavBarIndex === Number(this.item.order) - 1 ?
        '#1A0A59F7' :
        Color.Transparent
    )
    .onClick(() => {
      const index =  Number(this.item.order)  - 1;
      this.currentNavBarIndex = index;
      this.pathStack.replacePath({name: 'KnowledgeMapContent'});
    })
  }
}