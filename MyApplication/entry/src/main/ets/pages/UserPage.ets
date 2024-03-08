class User {
  id: number
  name: string
  phone: string
  img: string
  constructor(id: number, name: string, phone: string, img: string) {
    this.id = id
    this.name = name
    this.phone = phone
    this.img = img
  }
}
import {Header} from "../Components/TitleComponent/Title"

@Builder function UserCard(User:User) {
  Row() {
    Column() {
      Image($r("app.media.icon"),)
        .height(90)
      Text(User.phone)
        .fontSize(20)
    }.alignItems(HorizontalAlign.Start)
    .height(120)

    Column() {
      Text(User.id.toFixed())
        .fontSize(20)
      Text(User.name)
        .fontSize(20)
    }.justifyContent(FlexAlign.SpaceEvenly)
    .height(120)
  }
  .width("100%")
  .backgroundColor("#36d")
  .padding(20)
  .margin(5)
  .height(120)
  .borderRadius(20)
  .justifyContent(FlexAlign.SpaceEvenly)
}
@Entry
@Component
struct Index {
  private users: Array<User> = [
    new User(1, 'Alice', '1234567890', "img"),
    new User(2, 'Bob', '9876543210', "img"),
    new User(3, 'Charlie', '5555555555', "img"),
    new User(4, 'David', '1112223333', "img"),
    new User(5, 'Eve', '9998887777', "img"),
    new User(1, 'Alice', '1234567890', "img"),
    new User(2, 'Bob', '9876543210', "img"),
    new User(3, 'Charlie', '5555555555', "img"),
    new User(4, 'David', '1112223333', "img"),
    new User(5, 'Eve', '9998887777', "img"),
  ]

  build() {
    Column({ space: 8 }) {
      Header({title:"商品列表"})
/*
      ForEach(
        this.users,
        (User: User) => {
          Row() {
            Column() {
              Image($r("app.media.icon"),)
                .height(90)
              Text(User.phone)
                .fontSize(20)
            }.alignItems(HorizontalAlign.Start)
            .height(120)

            Column() {
              Text(User.id.toFixed())
                .fontSize(20)
              Text(User.name)
                .fontSize(20)
            }.justifyContent(FlexAlign.SpaceEvenly)
            .height(120)
          }
          .width("100%")
          .backgroundColor("#36d")
          .padding(20)
          .margin(5)
          .height(120)
          .borderRadius(20)
          .justifyContent(FlexAlign.SpaceEvenly)
        }
      )*/
      this.ListFrom(8)
    }
    .width('100%')
  }
//局部
  @Builder ListFrom(num1:number){
    List({space:num1}){
      ForEach(
        this.users,
        (User: User) => {
          ListItem(){
            UserCard(User)
          }
        }
      )
    }.width("100%")
    .height('100%')
    .layoutWeight(1)
  }
}