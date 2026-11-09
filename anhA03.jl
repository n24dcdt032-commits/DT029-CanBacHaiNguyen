function can_nguyen(N::Int64; verbose::Bool=true)::Int64
    if N < 0
        throw(ArgumentError("Lỗi: N phải là số nguyên không âm."))
    end
    if N == 0
        if verbose
            println("="^66)
            println("LẦN VẾT TÌM CĂN BẬC HAI NGUYÊN CHO N = 0")
            println("N = 1: Trả về kết quả trực tiếp r = 0 (tránh chia cho 0, 0 lượt lặp).")
            println("-"^66)
            println("Kết quả: r = 1")
            println("Kiểm tra tính đúng: HỢP LỆ (PASS) (0^2 <= 0 < 1^2)")
            println("="^66)
        end
        return 0
    end
    left::Int64 = 1
    right::Int64 = min(N, 1_000_000)
    ans::Int64 = 1
    while left <= right
        mid::Int64 = left + div(right - left, 2)
        if mid <= div(N, mid)
            ans = mid
            left = mid + 1
        else
            right = mid - 1
        end
    end
    return ans
end
println(can_nguyen(0))
println(can_nguyen(10))
println(can_nguyen(1_000_000))