import { NavBarItemType } from "../model/NavBarItemType"
import { Section } from "../model/Section";
import { bufferToString } from "../utils/Tool";
import { NavBarItem } from "../view/NavBarItem";

@Component
export struct KnowledgeMap {

  @State sections: Section[] = [];

  @State list: NavBarItemType[] = [];


  getSections() {
    this.getUIContext().getHostContext()?.resourceManager.getRawFileContent('MapData.json').then(value => {
      // Get the buffer content and convert it to a string.
      let data: string = bufferToString(value);
      // Parse into data structures
      try {
        this.sections = JSON.parse(data) as Section[]

        this.list = this.sections.map((item, index): NavBarItemType => ({
          order: (index+1).toString().padStart(2, '0'),
          title: item.title
        }));


      } catch (e) {
        console.error("JSON 格式不正确", e);
      }

    });
  }

  aboutToAppear(): void {
    this.getSections()
  }

  build() {
    Scroll() {
      Column() {
        Text('知识地图')
          .fontFamily('HarmonyHeiTi-Bold')
          .fontSize(24)
          .fontColor(Color.Black)
          .textAlign(TextAlign.Start)
          .lineHeight(33)
          .fontWeight(700)
          .width('100%')

        Image($r("app.media.knowledge_map_banner"))
          .width('100%')
          .borderRadius(16)
          .margin({top: 19, bottom:8})

        Text('通过循序渐进的学习路径，无经验和有经验的开发者都可以轻松掌握ArkTS语言声明式开发范式，体验更简洁、更友好的HarmonyOS应用开发旅程。')
          .fontFamily('HarmonyHeiTi')
          .fontSize(14)
          .fontColor('rgba(0,0,0,0.60)')
          .fontWeight(400)
          .textAlign(TextAlign.Start)

        List({space: 12}) {
          ForEach(this.list, (item: NavBarItemType) => {
            ListItem() {
              NavBarItem({item: item})
            }
            .width('100%')
          }, (item: NavBarItemType) => item.order)
        }
        .width('100%')
        .margin({top: 24})
      }
      .padding({ top: 0, right: 16, bottom: 12, left: 16})
    }
    .backgroundColor('#F1F3F5')
    .align(Alignment.Start)
    .constraintSize({ minHeight: '100%' })
    .edgeEffect(EdgeEffect.Spring)

  }
}

@Preview
@Component
struct Demo {
  build() {
    KnowledgeMap()
  }
}