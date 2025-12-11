import { BannerView } from '../view/BannerView';
import { EnablementView } from '../view/EnablementView';
import { TutorialView } from '../view/TutorialView';


@Entry
@Component
struct Index {
  @State message: string = '快速入门';

  build() {
    Column() {
      Text(this.message)
        // .id('HelloWorld')
        // .fontSize($r('app.float.page_text_font_size'))
        //.fontWeight(FontWeight.Bold)
        .fontSize(24)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .fontFamily('HarmonyHeiTi-Bold')
        //.background('#FF0000')
        .lineHeight(33)
        // .alignRules({
        //   center: { anchor: '__container__', align: VerticalAlign.Center },
        //   middle: { anchor: '__container__', align: HorizontalAlign.Center }
        // })
        // .onClick(() => {
        //   this.message = 'Welcome';
        // })
      Scroll() {
        Column() {
          BannerView()
          EnablementView()
          TutorialView()
        }
      }
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .layoutWeight(1)

    }
    .height('100%')
    .width('100%')
    .background('#F1F3F5')
  }
}






