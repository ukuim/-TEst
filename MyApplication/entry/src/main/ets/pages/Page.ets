import router from '@ohos.router'
import uri from '@ohos.uri'
@Entry
@Component
struct Page {
  @State message: string = 'Hello World'

  build() {

      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)


        Button("点击跳转user")
          .width("100%")
          .onClick(()=>{
            router.pushUrl({
              url:"pages/UserPage"
            },
              router.RouterMode.Single
            )
          })

      }
      .width('100%')
      .height('100%')
  }
}