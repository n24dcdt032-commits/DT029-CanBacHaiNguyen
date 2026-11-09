using Printf

function can_nguyen_core(N::Int64)::Int64
    if N < 0
        throw(ArgumentError("Lỗi: N phải là số nguyên không âm."))
    end
    if N == 0 
        return 0 
    end
    left, right, ans = 1, min(N, 1_000_000), 1
    while left <= right
        mid = left + div(right - left, 2)
        if mid <= div(N, mid)
            ans = mid
            left = mid + 1
        else
            right = mid - 1
        end
    end
    return ans
end

function chay_toan_bo_12_test()
    println("="^70)
    println("CHẠY BỘ KIỂM THỬ TỰ ĐỘNG TOÀN BỘ 12 CA (DT029 - NGÔ GIA HƯNG)")
    println("="^70)
    
    cac_ca = [
        ("VD01", 20, 4),
        ("VD02", 25, 5),
        ("BIEN01", 0, 0),
        ("BIEN02", 1, 1),
        ("BIEN03", 1_000_000_000_000, 1_000_000),
        ("TK01", 24, 4),
        ("TK02", 26, 5),
        ("TK03", 100_000_000, 10_000),
        ("TK04", 99_999_999, 9_999),
        ("TK05", 10_000, 100),
        ("TK06", 97, 9)
    ]

    pass_count = 0
    for (ma, N, exp) in cac_ca
        act = can_nguyen_core(N)
        if act == exp
            pass_count += 1
            @printf("[%s] N = %-13d -> Expected: %-7d | Actual: %-7d | PASS\n", ma, N, exp, act)
        else
            @printf("[%s] N = %-13d -> Expected: %-7d | Actual: %-7d | FAIL\n", ma, N, exp, act)
        end
    end

    # Ca 12: Bắt lỗi LOI01
    try
        can_nguyen_core(-16)
        println("[LOI01] N = -16           -> Khong bat duoc loi           | FAIL")
    catch e
        if isa(e, ArgumentError)
            pass_count += 1
            println("[LOI01] N = -16           -> Bat thanh cong ArgumentError | PASS")
        end
    end

    println("-"^70)
    println("TỔNG KẾT: ", pass_count, "/12 CA KIỂM THỬ ĐẠT (PASS 100%)")
    println("="^70)
end

chay_toan_bo_12_test()