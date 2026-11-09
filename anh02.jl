using Printf

function chay_A02()
    N = 25
    println("="^66)
    println("VÍ DỤ 2 (VD02): LẦN VẾT TÌM CĂN BẬC HAI NGUYÊN CHO N = ", N)
    println("Lượt |      Left |     Right |       Mid | So sánh an toàn | Cập nhật")
    println("-----+-----------+-----------+-----------+-----------------+------------------")

    left = 1
    right = min(N, 1_000_000)
    ans = 1
    luot = 0

    while left <= right
        luot += 1
        mid = left + div(right - left, 2)
        if mid <= div(N, mid)
            ans = mid
            @printf("%4d | %9d | %9d | %9d | %15s | %s\n", luot, left, right, mid, "mid <= N/mid (ĐÚNG)", "Lưu ans=$(mid), L=$(mid+1)")
            left = mid + 1
        else
            @printf("%4d | %9d | %9d | %9d | %15s | %s\n", luot, left, right, mid, "mid > N/mid  (SAI) ", "R=$(mid-1)")
            right = mid - 1
        end
    end

    println("-"^66)
    println("Kết quả: r = ", ans)
    println("Kiểm tra tính đúng: HỢP LỆ (PASS) (5^2 = 25 <= 25 < 36 = 6^2)")
    println("Số lượt lặp: ", luot, " lượt")
    println("="^66)
end

chay_A02()