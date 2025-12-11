import { ArticleClass } from '../model/ArticleClass'
import { bufferToString } from '../util/Tool';

@Component
export struct EnablementItem {

  @Prop item: ArticleClass

  build() {
    Column() {
      Image($r(this.item.imageSrc))
        .objectFit(ImageFit.Cover)
        .width('100%')
        .height(96)
        .borderRadius({topLeft: 16, topRight: 16})
      Text(this.item.title)
        .width('100%')
        .height(19)
        .fontSize(14)
        .fontWeight(400)
        .textAlign(TextAlign.Start)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .maxLines(1)
        .padding({left: 12, right: 12})
        .margin({top: 8})
      Text(this.item.brief)
        .width('100%')
        .height(32)
        .fontSize(12)
        .fontWeight(400)
        .fontColor('rgba(0,0,0,0.6)')
        .textAlign(TextAlign.Start)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .maxLines(2)
        .padding({left: 12, right: 12})
        .margin({top: 2})
    }
    .width(160)
    .height(169)
    .borderRadius(16)
    .backgroundColor(Color.White)
  }
}

@Component
export struct EnablementView {
  @State list: Array<ArticleClass> = [];

  getDataFromJson() {
    this.getUIContext().getHostContext()?.resourceManager.getRawFileContent('EnablementData.json').then(value => {
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
      Text('赋能套件')
        .width('100%')
        .fontSize(16)
        .fontWeight(500)
        .fontColor('#182431')
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .maxLines(1)
        .padding({left: 16})
        .margin({bottom: 8.5})
      Grid() {
        ForEach(this.list, (item: ArticleClass) => {
          GridItem() {
            EnablementItem({item: item})
          }
        }, (item: ArticleClass) => item.id)
      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(169)
      .padding({top: 2, left: 16, right: 16})
    }
    .margin({top: 18})
    .alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}

@Preview
struct Demo {
  build() {
    Column() {
      EnablementView()
    }
    // .height('100%')
    // .width('100%')
    .background('#ff0000')
  }
}