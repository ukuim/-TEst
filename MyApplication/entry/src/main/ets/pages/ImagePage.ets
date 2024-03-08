import securityLabel from '@ohos.file.securityLabel';

@Entry
@Component
struct Index {
  //Row()  左右
  //Column() 上下
  //
  //  .justifyContent 列
  //   .alignItems 行
  @State ImageValue: number = 30;

  build() {
    Column() {
      Row() {
        Image($r('app.media.icon'))
          .interpolation(ImageInterpolation.High)
          .width(this.ImageValue)

      }
      .width("100%")
      .height(300)
      .justifyContent(FlexAlign.Center)

      Row() {
        Text($r("app.string.comment_QQ"))
          .fontSize(20)

        TextInput({ placeholder: "输入width%", text: this.ImageValue.toFixed() })
          .width(250)
          .backgroundColor("#36D")
          .type(InputType.Normal)
          .onChange(value => {
            this.ImageValue = parseInt(value)
          })

      }
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)

      Row(){

        Button("缩小")
          .width(100)
          .height(50)
          .type(ButtonType.Capsule)
          .onClick(() => {
            if (this.ImageValue >= 10) {
              this.ImageValue -= 10

            }
          })
        Button("放大")
          .width(100)
          .height(50)
          .type(ButtonType.Capsule)
          .onClick(() => {
            if (this.ImageValue <= 300) {
              this.ImageValue += 10
            }
          })
      }
      .width("100%")
      .justifyContent(FlexAlign.SpaceEvenly)

      Slider({
        min: 10,
        max: 300,
        value: 30,
        style: SliderStyle.InSet, //inset
        direction: Axis.Horizontal,
        reverse: false //是否反向
      })
        .width(250)
        .colorBlend("red")
        .onChange(value => {
          this.ImageValue = value
        })
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .width('100%')
    .height('100%')
  }
}