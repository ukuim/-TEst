import uri from '@ohos.uri'
@Entry
@Component
struct Page {
  @State message: string = 'Hello World'

  build() {

    Column() {
      Text(this.message)
        .position({
          x:10,
          y:0
        })
        .rotate({
          angle:0,
          centerX:"50%",
          centerY:"50%"
        })
    }
    .width('100%')
    .height('100%')
  }
}