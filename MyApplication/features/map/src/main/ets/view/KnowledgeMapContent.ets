import { KnowledgeBaseItem, Material, Section, TypeMapIcon } from "../model/Section";
import { MaterialType } from "@ohos.graphics.scene";

@Component
export struct KnowledgeMapContent {

  scroller: Scroller = new Scroller();

  @Prop section: Section;

  @Builder
  LineItem(baseItem: KnowledgeBaseItem) {
     Row() {
       Image($r(TypeMapIcon[baseItem.type]))
         .width(20)
         .height(20)
       Column() {
         Text(baseItem.title)
           .fontFamily('HarmonyHeiTi-Medium')
           .fontSize(16)
           .fontWeight(500)
         Text(baseItem.type)
           .fontFamily('HarmonyHeiTi')
           .fontSize(14)
           .fontWeight(400)
       }
       .alignItems(HorizontalAlign.Start)
       .margin({left: 18})

       Blank()
       Image($r('app.media.ic_arrow'))
         .width(12)
         .height(24)
     }
     .width('100%')
     .height(64)
     .alignItems(VerticalAlign.Center)
  }

  @Builder
  Group(material: Material) {
    Column() {
      Text(material.subtitle)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontSize(14)
        .fontWeight(500)
        .margin({ bottom: 8 })

      List({space: 12}) {
        ForEach(material.items, (item: KnowledgeBaseItem) => {
          ListItem() {
            this.LineItem(item)
          }
        }, (item: KnowledgeBaseItem) => item.title)
      }
      .backgroundColor(Color.White)
      .borderRadius(16)
      .padding({ left: 12, right: 12 })
      .divider({
        strokeWidth: 0.5,
        startMargin: 38,
        endMargin: 0,
        color: '#F2F2F2'
      })
    }
    .alignItems(HorizontalAlign.Start)
    .margin({top: 18})

  }

  build() {

    Scroll(this.scroller) {
      Column() {
        Text(this.section?.title)
          .fontFamily('HarmonyHeiTi-Bold')
          .fontSize(20)
          .fontWeight(700)
          .fontColor(Color.Black)

        Text(this.section?.brief)
          .fontFamily('HarmonyHeiTi')
          .fontSize(12)
          .fontColor('rgba(0,0,0,0.60)')
          .textAlign(TextAlign.JUSTIFY)
          .fontWeight(400)
          .margin({ top: 12, bottom: 12 })

        ForEach(this.section?.materials, (item: Material) => {
          this.Group(item)
        }, (item: Material) => item.subtitle)
      }
      .alignItems(HorizontalAlign.Start)
      .padding({
        top: 12,
        left: 16,
        bottom: 12,
        right: 16
      })
      .width('100%')
    }
    .align(Alignment.TopStart)
    .constraintSize({ minHeight: '100%' })
    .edgeEffect(EdgeEffect.Spring)
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Auto)
    .backgroundColor('#F1F3F5')

  }
}