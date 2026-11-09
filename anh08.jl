function isqrt_bs(N::Int)
    left, right, ans, luot = 0, min(N, 3_037_000_499), 0, 0
    while left <= right
        luot += 1
        mid = left + div(right - left, 2)
        if mid == 0 || mid <= div(N, mid)   # mid^2 <= N, tránh tràn số
            ans = mid
            left = mid + 1
        else
            right = mid - 1
        end
    end
    return ans, luot
end

function chay_A08()
    for (N, ten_ca) in [(10_000, "TK05 (Số tròn 10^4)"),
                        (97, "TK06 (Số nguyên tố 97)")]
        println("="^66)
        println("CA ", ten_ca, ": N = ", N)
        ans, luot = isqrt_bs(N)
        println("Số lượt lặp: ", luot)
        println("Kết quả: r = ", ans)
        ok = ans^2 <= N < (ans + 1)^2 && ans == isqrt(N)
        println("Kiểm tra tính đúng: ", ok ? "HỢP LỆ (PASS)" : "SAI (FAIL)",
                " ($(ans)^2 <= $(N) < $(ans+1)^2)")
        println("="^66)
    end
end

chay_A08()