import {BannerClass} from '../model/BannerClass'
import { bufferToString } from '../util/Tool';


@Component
export struct BannerView {
  @State list:Array<BannerClass> = [];
  @Consume pathStack: NavPathStack;

  getDataFromJson() {
    this.getUIContext().getHostContext()?.resourceManager.getRawFileContent('BannerData.json').then(value => {
      // Get the buffer content and convert it to a string.
      let data: string = bufferToString(value);
      // Parse into data structures
      try {
        this.list = JSON.parse(data) as BannerClass[]
      } catch (e) {
        console.error("JSON 格式不正确", e);
      }

    });
  }

  aboutToAppear(): void {
    this.getDataFromJson()
  }

  build() {
    Swiper() {
      ForEach(this.list, (item: BannerClass, index: number) => {
        Image($r(item.imageSrc))
          .objectFit(ImageFit.Contain)
          .width('100%') //这里设置宽度为100%后，图片会置顶显示
          .padding({left: 16, top: 11, right: 16, bottom: 11})
          .borderRadius(16)
        //.background("#FF0000")
          .onClick(()=>{
            this.pathStack.pushPathByName('bannerDetailPage', item);
          })
      }, (item: BannerClass, index: number) => {
        return item.id
      } )
    }
    .autoPlay(true)
    .loop(true)
    // .indicator(
    //   new DotIndicator().color('#000000')
    //     .selectedColor('#ff0000')
    // )
  }
}

@Preview
struct Demo {
  build() {
    Column() {
      BannerView()
    }
    // .height('100%')
    // .width('100%')
    .background('#ff0000')
  }
}