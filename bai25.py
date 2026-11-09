def binh_phuong_khong_vuot(mid, N):
    if mid == 0:
        return True
    return mid <= N // mid

def kiem_tra_can(N, r):
    if r < 0:
        return False
    dieu_kien_1 = (r == 0) or (r <= N // r)
    dieu_kien_2 = (r + 1 > N // (r + 1))
    return dieu_kien_1 and dieu_kien_2

def can_nguyen(N, verbose=True):
    if N < 0:
        raise ValueError("Lỗi: N phải là số nguyên không âm.")
    if N == 0:
        return 0

    left = 1
    right = min(N, 1000000)
    ans = 1
    luot = 0

    if verbose:
        print("=" * 66)
        print(f"LẦN VẾT TÌM CĂN BẬC HAI NGUYÊN CHO N = {N}")
        print("Lượt |      Left |     Right |       Mid | So sánh an toàn | Cập nhật")
        print("-----+-----------+-----------+-----------+-----------------+------------------")

    while left <= right:
        luot += 1
        mid = left + (right - left) // 2
        hop_le = binh_phuong_khong_vuot(mid, N)

        if verbose:
            ket_qua_str = "mid <= N/mid (ĐÚNG)" if hop_le else "mid > N/mid  (SAI) "
            hanh_dong_str = f"Lưu ans={mid}, L={mid+1}" if hop_le else f"R={mid-1}"
            print(f"{luot:4d} | {left:9d} | {right:9d} | {mid:9d} | {ket_qua_str:15s} | {hanh_dong_str}")

        if hop_le:
            ans = mid
            left = mid + 1
        else:
            right = mid - 1

    if verbose:
        hop_le_kiem_tra = "HỢP LỆ (PASS)" if kiem_tra_can(N, ans) else "LỖI (FAIL)"
        print("-" * 66)
        print(f"Kết quả: r = {ans}")
        print(f"Kiểm tra tính đúng: {hop_le_kiem_tra} ({ans*ans} <= {N} < {(ans+1)*(ans+1)})")
        print("=" * 66)

    return ans
