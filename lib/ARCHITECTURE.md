# Cấu trúc thư mục `lib/`

Tài liệu mô tả chức năng từng folder trong project, áp dụng **Clean Architecture**.

---

## Tổng quan

```
lib/
├── core/                    # Hạt nhân dùng chung toàn app
├── features/                # Các feature theo từng module
│   ├── home/
│   ├── ride_booking/
│   └── auth/
└── main.dart                # Entry point
```

---

## `core/`

Chứa code dùng chung, không phụ thuộc business logic.

| Folder | Chức năng |
|--------|-----------|
| **constants/** | Hằng số app: tên app, key, giá trị cố định |
| **di/** | Dependency Injection: khởi tạo và cung cấp dependencies |
| **errors/** | Exceptions và Failures dùng thống nhất trong app |
| **theme/** | Theme (light/dark), màu sắc, typography |

---

## `features/`

Mỗi feature là một module độc lập, tuân theo Clean Architecture với 3 tầng: **data** → **domain** → **presentation**.

### Cấu trúc mỗi feature

```
feature_name/
├── data/                    # Dữ liệu & triển khai nguồn dữ liệu
├── domain/                  # Business logic thuần túy
└── presentation/            # UI, state management
```

---

### `features/[feature]/data/`

Tầng dữ liệu: truy xuất và biến đổi dữ liệu.

| Folder | Chức năng |
|--------|-----------|
| **datasources/** | Remote (API) hoặc Local (DB/cache) data sources |
| **models/** | DTO, class map với JSON/DB, extends Entity |
| **repositories/** | Triển khai Repository interface của domain |

---

### `features/[feature]/domain/`

Tầng nghiệp vụ: không phụ thuộc framework hay UI.

| Folder | Chức năng |
|--------|-----------|
| **entities/** | Đối tượng nghiệp vụ thuần |
| **repositories/** | Abstract interfaces của Repository |
| **usecases/** | Một nhiệm vụ cụ thể (business use case) |

---

### `features/[feature]/presentation/`

Tầng giao diện và state management.

| Folder | Chức năng |
|--------|-----------|
| **bloc/** hoặc **cubit/** | Bloc/Cubit: Event/Cubit + State |
| **pages/** | Màn hình (pages/screens) |
| **widgets/** | Widget tái sử dụng trong feature (nếu có) |

---

## Các feature hiện có

### `features/home/`

- **Chức năng:** Trang chủ
- **State:** Bloc (Event + State)
- **Files:** `home_bloc`, `home_event`, `home_state`

### `features/ride_booking/`

- **Chức năng:** Đặt xe
- **State:** Cubit
- **Files:** `ride_cubit`, `ride_state`, `ride_booking_page`, data/domain layers

### `features/auth/`

- **Chức năng:** Đăng nhập, đăng ký, xác thực
- **Trạng thái:** Đang setup

---

## Luồng dữ liệu (Data flow)

```
UI (Page/Widget)
    ↓ dispatch event / call cubit
Bloc/Cubit
    ↓ call
UseCase
    ↓ call
Repository (abstract)
    ↑ implement
RepositoryImpl
    ↓ use
DataSource (Remote/Local)
```

---

## Dependency rule

- **Presentation** → **Domain** (chỉ gọi UseCase, Repository interface)
- **Domain** ← **Data** (không phụ thuộc Data)
- **Data** → **Domain** (implement Repository, dùng Entity)
