using Printf

function binh_phuong_khong_vuot(mid::Int64, N::Int64)::Bool
    if mid == 0
        return true
    end
    return mid <= div(N, mid)
end

function kiem_tra_can(N::Int64, r::Int64)::Bool
    if r < 0
        return false
    end
    dieu_kien_1 = (r == 0) || (r <= div(N, r))
    dieu_kien_2 = (r + 1 > div(N, r + 1))
    return dieu_kien_1 && dieu_kien_2
end

function can_nguyen(N::Int64; verbose::Bool=true)::Int64
    if N < 0
        throw(ArgumentError("Lỗi: N phải là số nguyên không âm."))
    end
    if N == 0
        return 0
    end

    left::Int64 = 1
    right::Int64 = min(N, 1_000_000)
    ans::Int64 = 1
    luot::Int64 = 0

    if verbose
        println("="^66)
        println("LẦN VẾT TÌM CĂN BẬC HAI NGUYÊN CHO N = ", N)
        println("Lượt |      Left |     Right |       Mid | So sánh an toàn | Cập nhật")
        println("-----+-----------+-----------+-----------+-----------------+------------------")
    end

    while left <= right
        luot += 1
        mid::Int64 = left + div(right - left, 2)
        hop_le = binh_phuong_khong_vuot(mid, N)

        if verbose
            ket_qua_str = hop_le ? "mid <= N/mid (ĐÚNG)" : "mid > N/mid  (SAI) "
            hanh_dong_str = hop_le ? "Lưu ans=$(mid), L=$(mid+1)" : "R=$(mid-1)"
            @printf("%4d | %9d | %9d | %9d | %15s | %s\n", luot, left, right, mid, ket_qua_str, hanh_dong_str)
        end

        if hop_le
            ans = mid
            left = mid + 1
        else
            right = mid - 1
        end
    end

    if verbose
        println("-"^66)
        println("Kết quả: r = ", ans)
        println("Kiểm tra tính đúng: ", kiem_tra_can(N, ans) ? "HỢP LỆ (PASS)" : "LỖI (FAIL)")
        println("="^66)
    end

    return ans
end

# CHẠY VÍ DỤ 1 (N = 20) ĐỂ LẤY ẢNH A01:
can_nguyen(20; verbose=true)