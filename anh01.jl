using Printf

function chay_A01()
    N = 20
    println("="^70)
    println("VÍ DỤ 1 (VD01): LẦN VẾT TÌM CĂN BẬC HAI NGUYÊN CHO N = ", N)
    println("Lượt |      Left |     Right |       Mid | So sánh an toàn     | Cập nhật")
    println("-----+-----------+-----------+-----------+---------------------+------------------")
    left = 1
    right = min(N, 1_000_000)
    ans = 1
    luot = 0
    while left <= right
        luot += 1
        mid = left + div(right - left, 2)
        if mid <= div(N, mid)
            ans = mid
            @printf("%4d | %9d | %9d | %9d | %19s | %s\n", luot, left, right, mid,
                    "mid <= N/mid (ĐÚNG)", "Lưu ans=$(mid), L=$(mid+1)")
            left = mid + 1
        else
            @printf("%4d | %9d | %9d | %9d | %19s | %s\n", luot, left, right, mid,
                    "mid > N/mid  (SAI) ", "R=$(mid-1)")
            right = mid - 1
        end
    end
    println("-"^70)
    println("Kết quả: r = ", ans)
    ok = ans^2 <= N < (ans + 1)^2
    println("Kiểm tra tính đúng: ", ok ? "HỢP LỆ (PASS)" : "SAI (FAIL)",
            " ($(ans)^2 = $(ans^2) <= $(N) < $((ans+1)^2) = $(ans+1)^2)")
    println("Số lượt lặp: ", luot, " lượt")
    println("="^70)
end


chay_A01()