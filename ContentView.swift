import SwiftUI

struct ContentView: View {
    @State private var sleepHours: Int = 0 // 用来保存输入的睡眠时间
    @State private var selectedEmojis: [String] = Array(repeating: "", count: 24) // 存储每小时选择的emoji
    @State private var isMenuBarActive: Bool = false // 控制菜单栏是否显示

    let emojis = ["🟥", "🟧", "🟨", "🟩", "🟦", "🟪", "⬛️", "⬜️"]

    var body: some View {
        VStack {
            // 输入睡眠时间
            if sleepHours == 0 {
                VStack {
                    Text("请输入今天的睡眠时间（小时）:")
                        .padding(.top)
                    TextField("睡眠小时数", value: $sleepHours, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding()
                    Button("确认睡眠时间") {
                        // 隐藏前 X 个格子
                    }
                    .padding()
                }
            }

            // 竖条格子
            HStack {
                ForEach(0..<24, id: \.self) { index in
                    let isSleepSlot = index < sleepHours // 判断是否为睡眠时间，前 sleepHours 个格子消失
                    if !isSleepSlot {
                        Button(action: {
                            // 弹出选择 emoji 的操作
                            let emojiSelection = emojis.randomElement() ?? "🟩" // 随机选择一个 emoji
                            selectedEmojis[index] = emojiSelection // 存储选中的 emoji
                        }) {
                            Text(selectedEmojis[index])
                                .frame(width: 40, height: 40)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                                .padding(2)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(width: 50, height: 600) // 设置竖条的宽度和高度
        .background(Color.gray)
        .cornerRadius(10)
        .padding()
        .overlay(
            VStack {
                if isMenuBarActive {
                    Button("关闭") {
                        // 关闭窗口的操作
                        isMenuBarActive.toggle()
                    }
                    .padding()
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
