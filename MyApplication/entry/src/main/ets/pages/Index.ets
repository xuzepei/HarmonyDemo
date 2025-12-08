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
      Banner()
    }
    .height('100%')
    .width('100%')
    .background('#F1F3F5')
  }
}

@Preview
@Component
struct Banner {
  build() {
    Image($r('app.media.banner_pic1'))
      .objectFit(ImageFit.Contain)
      .width('100%') //这里设置宽度为100%后，图片会置顶显示
      .padding({left: 16, top: 11, right: 16, bottom: 11})
      .borderRadius(16)
      //.background("#FF0000")
  }
}