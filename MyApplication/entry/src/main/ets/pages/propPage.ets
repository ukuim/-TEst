@Observed
class Task {
  static id: number = 1
  name: string = `任务${Task.id++}`
  finished: boolean = false
}

class TaskInfo {
  total: number = 0
  finish: number = 0
}

@Component
struct TaskTital {
  /*  @Prop total: number
    @Prop finish: number*/
  @Consume stat: TaskInfo

  build() {
    Row() {
      Text("任务进度")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Stack() {
        Progress({
          value: this.stat.finish,
          total: this.stat.total,
          type: ProgressType.Ring,
        })
        .backgroundColor("red")
        Row() {
          Text(this.stat.finish.toFixed())
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
          Text("/" + this.stat.total.toFixed())
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
      }
    }.justifyContent(FlexAlign.SpaceEvenly)
    .width("100%")
  }
}

@Component
struct TaskList {
  @State task: Task[] = []
  /*@Link total: number
  @Link finish: number*/
  @Consume stat: TaskInfo

  update() {
    this.stat.total = this.task.length
    this.stat.finish = this.task.filter(all => all.finished).length
  }

  build() {
    Column() {
      Button("添加")
        .width(200)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.task.push(new Task())
          this.update()
        })
      List({ space: 10 }) {
        ForEach(
          this.task,
          (task: Task, index) => {
            ListItem() {
              CardRow({ task: task, onTask: this.update.bind(this) })

            }
            .swipeAction({ end: this.delete(index) })
          }

        )
      }.width("100%")
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }

  @Builder delete(index: number) {
    Button() {
      Image($r('app.media.app_icon'))
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Black)
    .margin(5)
    .onClick(() => {
      this.task.splice(index, 1)
      this.update()
    })

  }
}

@Component
struct CardRow {
  @ObjectLink task: Task
  onTask: () => void

  build() {
    Row() {
      if (this.task.finished) {
        Text(this.task.name)
          .fontSize(20)
          .fontColor('#b1b2b1')
          .decoration({ type: TextDecorationType.LineThrough })
      } else {
        Text(this.task.name)
          .fontSize(20)
      }
      Checkbox()
        .select(this.task.finished)
        .onChange(val => {
          this.task.finished = val
          this.onTask()
        })
    }
    .height(200)
    .margin(10)
    .backgroundColor("pink")
    .height(30)
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Entry
@Component
struct Page {
  /*
  @State total: number = 0
  @State finish: number = 0*/
  // @State stat:TaskInfo=new TaskInfo()
  @Provide stat: TaskInfo = new TaskInfo()

  build() {
    Column({ space: 10 }) {
      //组件单向传递
      TaskTital()
      //组件双向传递
      TaskList() //stat:$stat /*finish: $finish, total: $total*/})
    }
  }
}