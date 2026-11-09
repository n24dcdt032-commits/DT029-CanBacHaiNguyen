function isqrt_bs(N::Int)
    left, right, ans, luot = 0, min(N, 3_037_000_499), 0, 0
    while left <= right
        luot += 1
        mid = left + div(right - left, 2)
        if mid == 0 || mid <= div(N, mid)
            ans = mid
            left = mid + 1
        else
            right = mid - 1
        end
    end
    return ans, luot
end

function chay_A07()
    for (N, ten_ca) in [(100_000_000, "TK03 (Chinh phuong 10^8)"),
                        (99_999_999, "TK04 (Can duoi 10^8 - 1)")]
        println("="^66)
        println("CA ", ten_ca, ": N = ", N)
        ans, luot = isqrt_bs(N)
        println("So luot lap: ", luot)
        println("Ket qua: r = ", ans)
        ok = ans^2 <= N < (ans + 1)^2 && ans == isqrt(N)
        println("Kiem tra tinh dung: ", ok ? "HOP LE (PASS)" : "SAI (FAIL)")
        println("="^66)
    end
end

chay_A07()