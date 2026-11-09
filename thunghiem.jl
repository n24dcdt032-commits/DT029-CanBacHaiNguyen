function binh_phuong_khong_vuot(mid::Int64, N::Int64)::Bool
    if mid == 0
        return true
    end
    # Sử dụng phép chia nguyên an toàn để triệt tiêu nguy cơ tràn số 64-bit
    return mid <= div(N, mid)
end

function can_nguyen(N::Int64; verbose::Bool=false)::Int64
    if N < 0
        throw(ArgumentError("Lỗi: N phải là số nguyên không âm."))
    end
    if N == 0
        return 0
    end

    left::Int64 = 1
    right::Int64 = min(N, 1_000_000)
    ans::Int64 = 1

    while left <= right
        mid::Int64 = left + div(right - left, 2)
        if binh_phuong_khong_vuot(mid, N)
            ans = mid          # Lưu nghiệm sàn hợp lệ lớn nhất hiện tại
            left = mid + 1     # Tiếp tục tìm kiếm về phía bên phải
        else
            right = mid - 1    # Thu hẹp không gian tìm kiếm về phía bên trái
        end
    end

    return ans
end
println(can_nguyen(20))
println(can_nguyen(25))
println(can_nguyen(0))
println(can_nguyen(10^12))
