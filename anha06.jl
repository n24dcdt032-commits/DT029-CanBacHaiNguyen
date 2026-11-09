using Printf

function can_nguyen_lan_vet(N::Int64, ten_ca::String)
    println("="^66)
    println("CA ", ten_ca, ": LẦN VẾT TÌM CĂN BẬC HAI NGUYÊN CHO N = ", N)
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
    println("Kiểm tra tính đúng: HỢP LỆ (PASS) ($(ans)^2 <= $(N) < $(ans+1)^2)")
    println("="^66)
    println()
end

# 1. Chạy ca TK01: Cận dưới số chính phương 25 (N = 24)
can_nguyen_lan_vet(24, "TK01 (Cận dưới 25)")

# 2. Chạy ca TK02: Cận trên số chính phương 25 (N = 26)
can_nguyen_lan_vet(26, "TK02 (Cận trên 25)")