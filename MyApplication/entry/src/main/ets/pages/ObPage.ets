import http from '@ohos.net.http'
import { request } from '../http/HttpRequest'

class Goods {
  id: number
  goodsName: string
  goodsUnit: string
  goodsPrice: number
  goodsDesc: string
  goodsImg: string
  goodsCagId: number

  constructor(id: number,
              goodsName: string,
              goodsUnit: string,
              goodsPrice: number,
              goodsDesc: string,
              goodsImg: string,
              goodsCagId: number) {
    this.id = id;
    this.goodsName = goodsName;
    this.goodsUnit = goodsUnit;
    this.goodsPrice = goodsPrice;
    this.goodsDesc = goodsDesc;
    this.goodsImg = goodsImg;
    this.goodsCagId = goodsCagId;
  }
}
/*function  request() {
  let httpRequest = http.createHttp();
  httpRequest.request("127.0.0.1:8080/findGoodsInfoList", {
    method:http.RequestMethod.GET
  },(err, data) => {
    if (!err) {
      console.info('Result:' + data.result);
    let jsonData = JSON.parse(data.result.toString())
      console.log("我是id:"+jsonData[1].id)
      return jsonData
    } else {
      console.info('error:' + JSON.stringify(err));
    }
  });
}*/


@Entry
@Component
struct Index {
  @State list: Array<Goods> = []

  aboutToAppear() {
    request("findGoodsInfoList", http.RequestMethod.GET).then((res) => {
      this.list = res.data
    })
  }
  build() {
    Column() {
      Row() {
        List({ space: 10 },) {
          ForEach(
            this.list,
            (goods: Goods) => {
              ListItem() {
                Row() {
                  Column() {
                    Row() {
                      Text(goods.id + "1111") {
                      }.width("80%")
                      .height("20%")
                      .textAlign(TextAlign.Start)
                      .backgroundColor('red')


                      Text(goods.id + "2222") {
                      }.width("20%")
                      .height("20%")
                      .textAlign(TextAlign.Start)
                      .backgroundColor('green')
                    }
                    Row() {
                      Text(goods.id + "333") {
                      }.width("100%")
                      .height("80%")
                      .textAlign(TextAlign.Start)
                      .backgroundColor("blue")
                    }
                  }
                  .width("60%")
                  Text("123")
                    .width("40%")
                    .backgroundColor("black")
                    .height("100%")
                }.height("20%")
              }
            }
          )
        }.width("100%")
        .layoutWeight(1)
      }

    }.width("100%")
    .height("100%")

  }
}


