@Component
export  struct  Header{
  private title:ResourceStr
  build(){
    Row() {
      Text("返回")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Text(this.title)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Blank()
      Text("刷新")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
    .width("100%")
    .margin({ bottom: 20 })
    .height(30)
  }
}