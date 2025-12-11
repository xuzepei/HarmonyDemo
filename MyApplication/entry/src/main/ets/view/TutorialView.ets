import { it } from "@ohos/hypium";
import { ArticleClass } from "../model/ArticleClass";
import { bufferToString } from '../util/Tool'



@Component
export struct TutorialItem {
  @Prop item: ArticleClass;

  build() {
    Row() {
      Column() {
        Text(this.item.title)
          .width('100%')
          .height(19)
          .fontSize(14)
          .fontWeight(400)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .margin({ top: 4 })
        Text(this.item.brief)
          .width('100%')
          .height(32)
          .fontSize(12)
          .fontWeight(400)
          .fontColor('rgba(0,0,0,0.6)')
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .margin({ top: 5 })
      }
      .height('100%')
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ right: 12 })

      Image($r(this.item.imageSrc))
        .objectFit(ImageFit.Cover)
        .width(108)
        .height(64)
        .borderRadius(16)
      //.layoutWeight(0)
    }
    .alignItems(VerticalAlign.Top)
    .width('100%')
    .height(88)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .padding(12)
  }
}

@Component
export struct TutorialView {
  @State list: Array<ArticleClass> = [];

  getDataFromJson() {
    this.getUIContext().getHostContext()?.resourceManager.getRawFileContent('TutorialData.json').then(value => {
      // Get the buffer content and convert it to a string.
      let data: string = bufferToString(value);
      // Parse into data structures
      try {
        this.list = JSON.parse(data) as ArticleClass[]
      } catch (e) {
        console.error("JSON 格式不正确", e);
      }

    });
  }

  aboutToAppear(): void {
    this.getDataFromJson()
  }

  build() {
    Column() {
      Text('入门教程')
        .width('100%')
        .fontSize(16)
        .fontWeight(500)
        .fontColor('#182431')
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      List({ space: 12 }) {
        ForEach(this.list, (item: ArticleClass) => {
          ListItem() {
            TutorialItem({ item: item })
          }
        }, (item: ArticleClass) => item.id)
      }
      .width('100%')
      .scrollBar(BarState.Off)
      .padding({ left: 16, right: 16 })
    }
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
  }
}

@Preview
struct Demo {
  build() {
    Column() {
      TutorialView()
    }
    // .height('100%')
    // .width('100%')
    .background('#ff0000')
  }
}