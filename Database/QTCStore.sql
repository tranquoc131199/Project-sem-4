-- chỉnh sửa mới
-- tạo csdl QTCStore
create database QTCStore
go

-- sử dụng csdl QTCStore vừa tạo
use QTCStore
go

-- bảng quản trị viên lưu thông tin người quản trị
create table Admins (
	AdminId int not null primary key identity, -- khoá chính
	AdminEmail varchar(250) not null unique, -- email đăng nhập
	AdminPassword varchar(128) not null, -- mật khẩu đăng nhập
	AdminFullname nvarchar(250) not null, -- họ và tên người quản trị
	AdminBirthday date not null default getdate(), -- ngày tháng năm sinh
	AdminIdCard varchar(20) not null unique, -- chứng minh nhân dân
	AdminGender int not null default 1, -- giới tính
	AdminAddress ntext not null, -- địa chỉ
	AdminHomeLand ntext not null, -- quê quán
	AdminPhone varchar(20) not null unique, -- số điện thoại
	AdminAvatar varchar(250) not null unique, -- ảnh đại diện
	AdminStatus int not null default 1 -- trạng thái
)
go

-- bảng khách hàng
create table Customers (
	CustomerId int not null primary key identity, -- khoá chính
	CustomerFullname nvarchar(250) not null, -- họ và tên khách hàng
	CustomerEmail varchar(250) not null unique, -- email để đăng nhập
	CustomerPhone varchar(20) null unique, -- số điện thoại
	CustomerPassword varchar(128) not null, -- mật khẩu
	CustomerAvatar varchar(250) not null, -- ảnh đại diện
	CustomerGender int not null default 1, -- giới tính
	CustomerBirthday date not null default getdate(), -- ngày sinh
	CustomerAddress ntext not null, -- địa chỉ
	CustomerCheckCode varchar(20), -- mã kiểm tra
	AdminId int null foreign key references Admins(AdminId), -- khoá ngoại mã quản trị viên khoá tài khoản người dùng
	CustomerStatus int not null default 1 -- trạng thái
)
go

-- bảng danh mục sản phẩm lưu thông tin danh mục sản phẩm
create table Categories (
	CategoryId int not null primary key identity, -- khoá chính
	CategoryName nvarchar(250) not null unique, -- tên danh mục
	CategoryPiority int not null, -- độ ưu tiên của danh mục
	ParentId int not null default 0, -- khoá ngoại danh mục cha (đệ quy)
	ParentName nvarchar(250) not null, -- tên danh mục cha
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	CategoryStatus int not null default 1 -- trạng thái
)
go

-- bảng hãng sản xuất
create table Brands (
	BrandId int not null primary key identity, -- khoá chính
	BrandName nvarchar(250) not null unique, -- tên hãng
	BrandPiority int not null, -- độ ưu tiên của hãng
	BrandLogo varchar(250) not null unique, -- logo của hãng
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	BrandStatus int not null default 1 -- trạng thái
)
go

-- bảng sản phẩm lưu thông tin tên sản phẩm, danh mục và hãng sản xuất
create table Products (
	ProductId int not null primary key identity, -- khoá chính
	ProductName nvarchar(250) not null unique, -- tên sản phẩm
	ProductCode varchar(50) not null, -- mã hiệu sản phẩm
	ProductStarAvg float not null default 5, -- số sao trung bình của sản phẩm (sao được đánh giá) - mặc định là 5 sao, cộng trung bình với các đánh giá khác để ra cái này
	ProductFeatureImage varchar(250) not null, -- hình ảnh sản phẩm
	ProductPrice float not null default 0, -- giá sản phẩm
	ProductSale int not null default 0, -- phần trăm hạ giá
	ProductWarranty int not null default 0, -- thời gian bảo hành (tính theo tháng)
	ProductSaleQuantity int not null default 0, -- số sản phẩm đã bán
	ProductDescription ntext not null default N'Đang cập nhật', -- mô tả sản phẩm
	CategoryId int not null foreign key references Categories(CategoryId), -- khoá ngoại mã danh mục
	BrandId int not null foreign key references Brands(BrandId), -- khoá ngoại mã hãng sản xuất
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	ProductStatus int not null default 1 -- trạng thái
)
go

-- bảng thông số kỹ thuật
create table Specifications (
	SpecificationId int not null primary key identity, -- khoá chính
	CategoryId int not null foreign key references Categories(CategoryId), -- khoá ngoại mã danh mục (mỗi danh mục sẽ có 1 bộ thông số kỹ thuật khác nhau)
	SpecificationName nvarchar(250) not null, -- tên thông số kỹ thuật (có thể trùng nhau do có thể khác danh mục sản phẩm)
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	SpecificationStatus int not null default 1 -- trạng thái
)
go

-- bảng chi tiết sản phẩm
create table ProductDetails (
	ProductDetailId int not null primary key identity, -- khoá chính
	ProductId int not null foreign key references Products(ProductId), -- khoá ngoại mã sản phẩm
	SpecificationId int not null foreign key references Specifications(SpecificationId), -- mã thông số kỹ thuật
	SpecificationValue nvarchar(1000) not null, -- giá trị thông số kỹ thuật
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	ProductDetailStatus int not null default 1 -- trạng thái
)
go

-- bảng hình ảnh sản phẩm
create table ProductImages (
	ProductImageId int not null primary key identity, -- khoá chính
	ProductId int not null foreign key references Products(ProductId), -- khoá ngoại mã sản phẩm
	ProductImage varchar(250) not null unique, -- hình ảnh sản phẩm
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	ProductImageStatus int not null default 1 -- trạng thái
)
go

-- bảng bình luận (đánh giá) sản phẩm (bắt buộc đăng nhập mới được đánh giá)
create table ProductComments (
	ProductCommentId int not null primary key identity, -- khoá chính
	ProductId int not null foreign key references Products(ProductId), -- khoá ngoại mã sản phẩm được đánh giá
	CustomerId int not null foreign key references Customers(CustomerId), -- khoá ngoại mã khách hàng đánh giá
	ProductCommentRate int not null default 5, -- đánh giá (số sao)
	ProductCommentContent nvarchar(500) null, -- bình luận (tối đa 500 kí tự)
	ProductCommentTime datetime not null default getdate(), -- ngày giờ đánh giá
	ProductCommentStatus int not null default 1 -- trạng thái
)
go

-- bảng các danh sách yêu thích
create table Wishlists (
	WishlistId int not null primary key identity, -- khoá chính
	CustomerId int not null foreign key references Customers(CustomerId), -- khoá ngoại mã khách hàng
	ProductId int not null foreign key references Products(ProductId), -- khoá ngoại mã sản phẩm được yêu thích
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	WishlistStatus int not null default 1 -- trạng thái
)
go

-- bảng chương trình khuyến mãi
create table Promotions (
	PromotionId int not null primary key identity, -- khoá chính
	PromotionTitle nvarchar(250) not null unique, -- tên chương trình khuyến mãi
	PromotionImage varchar(250) not null unique, -- hình ảnh đại diện của chương trình khuyến mãi
	PromotionDescription nvarchar(250) not null, -- mô tả ngắn của chương trình khuyến mãi
	PromotionContent ntext not null, -- nội dung bài viết giới thiệu chương trình khuyến mãi
	PromotionStart datetime not null default getdate(), -- ngày giờ bắt đầu chương trình khuyến mãi
	PromotionEnd datetime not null default getdate(), -- ngày giờ kết thúc chương trình khuyến mãi
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	PromotionStatus int not null default 1 -- trạng thái
)
go

-- bảng chi tiết chương trình khuyến mãi
create table PromotionDetails (
	PromotionDetailId int not null primary key identity, -- khoá chính
	PromotionId int not null foreign key references Promotions(PromotionId), -- khoá ngoại mã chương trình khuyến mãi
	ProductId int not null foreign key references Products(ProductId), -- khoá ngoại mã sản phẩm tham gia chương trình khuyến mãi
	PromotionSale int not null default 0, -- mức giảm giá của sản phẩm trong chương trình khuyến mãi (khi thêm sản phẩm vào chương trình khuyến mãi thì cập nhật thông số này trong bảng sản phẩm luôn)
	PromotionQuantity int not null default 1, -- số lượng sản phẩm trong chương trình khuyến mãi
	PromotionDetailStatus int not null default 1 -- trạng thái
)
go

-- bảng bình luận chương trình khuyến mãi
create table PromotionComments (
	PromotionCommentId int not null primary key identity, -- khoá chính
	PromotionId int not null foreign key references Promotions([PromotionId]), -- khoá ngoại mã chương trình khuyến mãi
	CustomerId int not null foreign key references Customers(CustomerId), -- khoá ngoại mã người dùng bình luận chương trình khuyến mãi
	PromotionCommentContent ntext not null, -- nội dung bình luận
	PromotionCommentTime datetime not null default getdate(), -- thời gian bình luận
	PromotionCommentStatus int not null default 1 --  trạng thái
)
go

-- bảng yêu thích chương trình khuyến mãi
create table PromotionLikes (
	PromotionLikeId int not null primary key identity, -- khoá chính
	PromotionId int not null foreign key references Promotions([PromotionId]), -- khoá ngoại mã chương trình khuyến mãi được yêu thích
	CustomerId int not null foreign key references Customers(CustomerId), -- khoá ngoại mã người dùng yêu thích chương trình khuyến mãi
	CreatedDate datetime not null default getdate(), -- ngày giờ người dùng bấm nút yêu thích chương trình khuyến mãi
	PromotionLikeStatus int not null default 1 -- trạng thái
)
go

-- bảng danh mục tin tức
create table Catalogs (
	CatalogId int not null primary key identity, -- khoá chính
	CatalogName nvarchar(250) not null unique, -- tên danh mục tin tức
	CatalogPiority int not null, -- độ ưu tiên
	ParentId int not null default 0, -- danh mục cha (đệ quy)
	ParentName nvarchar(250) not null, -- tên danh mục cha
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	CatalogStatus int not null default 1 -- trạng thái
)
go

-- bảng tin tức
create table News (
	[NewId] int not null primary key identity, -- khoá chính
	CatalogId int not null foreign key references Catalogs(CatalogId), -- khoá ngoại mã danh mục tin tức
	NewTitle nvarchar(250) not null unique, -- tiêu đề tin tức
	NewImage varchar(250) not null unique, -- hình ảnh đại diện cho tin tức
	NewDescription nvarchar(250) not null, -- mô tả tin tức
	NewContent ntext not null, -- nội dung tin tức
	NewLike int not null default 0, -- số lượt thích
	NewViewed int not null default 0, -- số lượt xem
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	NewStatus int not null default 1 -- trạng thái
)
go

-- bảng bình luận bài viết
create table NewComments (
	NewCommentId int not null primary key identity, -- khoá chính
	[NewId] int not null foreign key references News([NewId]), -- khoá ngoại mã bài viết
	CustomerId int not null foreign key references Customers(CustomerId), -- khoá ngoại mã khách hàng bình luận
	NewCommentContent ntext not null, -- nội dung bình luận
	NewCommentTime datetime not null default getdate(), -- thời gian bình luận
	NewCommentStatus int not null default 1 --  trạng thái
)
go

-- bảng yêu thích bài viết
create table NewLikes (
	NewLikeId int not null primary key identity, -- khoá chính
	[NewId] int not null foreign key references News([NewId]), -- khoá ngoại mã bài viết được yêu thích
	CustomerId int not null foreign key references Customers(CustomerId), -- khoá ngoại mã người dùng yêu thích bài viết
	CreatedDate datetime not null default getdate(), -- ngày giờ người dùng bấm nút yêu thích bài viết
	NewLikeStatus int not null default 1 -- trạng thái
)
go

-- bảng banner
create table Banners (
	BannerId int not null primary key identity, -- khoá chính
	BannerPiority int not null, -- độ ưu tiên của banner
	BannerImage varchar(250) not null unique, -- hình ảnh banner
	BannerDescription nvarchar(250) not null, -- mô tả banner (xuất hiện trong backend)
	[NewId] int null foreign key references News([NewId]), -- khoá ngoại mã bài viết liên kết tới banner
	PromotionId int null foreign key references Promotions(PromotionId), -- khoá ngoại mã chương trình khuyến mãi
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	BannerStatus int not null default 1
)
go

-- bảng vận chuyển
create table Transports (
	TransportId int not null primary key identity, -- khoá chính
	TransportName nvarchar(250) not null unique, -- loại hình vận chuyển
	TransportDescription ntext null, -- mô tả loại hình vận chuyển
	TransportPrice float not null default 0, -- giá cước vận chuyển
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	TransportStatus int not null default 1 -- trạng thái
)
go

-- bảng phương thức thanh toán
create table PaymentMethods (
	PaymentMethodId int not null primary key identity, -- khoá chính
	PaymentMethodName nvarchar(250) not null unique, -- tên phương thức thanh toán
	PaymentMethodDescription ntext null, -- mô tả phương thức thanh toán
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	PaymentMethodStatus int not null default 1
)
go

-- bảng mã giảm giá
create table Vouchers (
	VoucherId int not null primary key identity, -- khoá chính
	VoucherCode varchar(250) not null unique, -- mã giảm giá
	VoucherSale int not null default 0, -- mức độ giảm giá (%)
	VoucherQuantity int not null default 1, -- số lượng còn lại của mã giảm giá
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	VoucherStatus int not null default 1 -- trạng thái
)
go

-- bảng đơn hàng
create table Orders (
	OrderId int not null primary key identity, -- khoá chính
	OrderCode varchar(50) not null unique, -- mã đơn hàng
	CustomerId int not null foreign key references Customers(CustomerId), -- khoá ngoại mã người đặt hàng
	OrderTotalAmount float not null default 0, -- tổng tiền thanh toán
	TransportId int not null foreign key references Transports(TransportId), -- khoá ngoại hình thức vận chuyển
	PaymentMethodId int not null foreign key references PaymentMethods(PaymentMethodId), -- khoá ngoại phương thức thanh toán
	OrderNote ntext null, -- ghi chú đơn hàng
	OrderAddress ntext null, -- địa chỉ nhận hàng
	VoucherId int null foreign key references Vouchers(VoucherId), -- mã giảm giá
	VoucherSale float not null default 0, -- mức giảm giá của mã giảm giá tính đến thời điểm đặt hàng
	AdminId int null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên xác nhận đơn hàng
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	OrderStatus int not null default 1 -- trạng thái đơn hàng
)
go

-- bảng chi tiết đơn hàng
create table OrderDetails (
	OrderDetailId int not null primary key identity, -- khoá chính
	OrderId int not null foreign key references Orders(OrderId), -- khoá ngoại mã đơn hàng
	ProductId int null foreign key references Products(ProductId), -- khoá ngoại mã sản phẩm (1 trong 2 khoá ngoại này)
	PromotionDetailId int null foreign key references PromotionDetails(PromotionDetailId), -- khoá ngoại mã sản phẩm thuộc chương trình khuyến mãi (1 trong 2 khoá ngoại này)
	OrderDetailQuantity int not null default 1, -- số lượng sản phẩm
	OrderDetailPrice float not null default 0, -- giá sản phẩm tại thời điểm đặt hàng
	OrderDetailSale int not null default 0, -- mức hạ giá sản phẩm tại thời điểm đặt hàng
	AdminId int null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên xác nhận chi tiết đơn hàng (sản phẩm trong đơn hàng được giao hay chưa?)
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	OrderDetailStatus int not null default 1 -- trạng thái
)
go

-- bảng logo
create table Logoes (
	LogoId int not null primary key identity, -- khoá chính
	LogoImage varchar(250) not null unique, -- hình ảnh logo
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	LogoStatus int not null default 1 -- trạng thái
)
go

-- bảng icon
create table Icons (
	IconId int not null primary key identity, -- khoá chính
	IconImage varchar(250) not null unique, -- hình ảnh icon
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	IconStatus int not null default 1 -- trạng thái
)
go

-- bảng liên hệ
create table Contacts (
	ContactId int not null primary key identity, -- khoá chính
	ContactAddress ntext not null, -- địa chỉ liên hệ
	ContactEmail varchar(250) not null unique, -- email liên hệ
	ContactHotline varchar(20) not null unique, -- số điện thoại đường dây nóng
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	ContactStatus int not null default 1
)
go

-- bảng mạng xã hội
create table Socials (
	SocialId int not null primary key identity, -- khoá chính
	SocialName nvarchar(250) not null unique, -- tên mạng xã hội
	SocialLink varchar(250) not null unique, -- đường dẫn đến trang mạng xã hội
	SocialIcon nvarchar(250) not null unique, -- icon đại diện của trang mạng xã hội (có thể là hình ảnh)
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	SocialStatus int not null default 1 -- trạng thái
)
go

-- bảng email đăng ký nhận tin tức
create table RegistedEmails (
	RegistedEmailId int not null primary key identity, -- khoá chính
	RegistedEmail varchar(250) not null unique, -- email đăng ký nhận tin
	RegistedDate datetime not null default getdate(), -- ngày đăng ký
	RegistedEmailStatus int not null default 1 -- trạng thái
)
go

-- bảng nội dung email đã gửi
create table SendEmails (
	SendEmailId int not null primary key identity, -- khoá chính
	RegistedEmailId int not null foreign key references RegistedEmails(RegistedEmailId), -- khoá ngoại mã email nhận tin
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên gửi email
	EmailType nvarchar(250) not null default N'Tự động', -- loại email (tự động sau khi đăng sản phẩm, tin tức hoặc chương trình khuyến mãi - thủ công khi muốn gửi email với mục đích riêng)
	EmailTitle nvarchar(250) not null, -- tiêu đề email gửi
	EmailContent ntext not null, -- nội dung email
	SendEmailTime datetime not null default getdate(), -- thời gian gửi email
	SendEmailStatus int not null default 1 -- trạng thái
)
go

-- bảng FAQ
create table FAQs (
	FAQId int not null primary key identity, -- khoá chính
	FastQuestion nvarchar(250) not null unique, -- câu hỏi thường gặp
	FastAnswer ntext not null, -- câu trả lời
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	FAQStatus int not null default 1
)
go

-- bảng danh mục phản hồi
create table FeedbackCatalogs (
	FeedbackCatalogId int not null primary key identity, -- khoá chính
	FeedbackCatalogName nvarchar(250) not null unique, -- tên danh mục phản hồi
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	FeedbackCatalogStatus int not null default 1 -- trạng thái
)
go

-- bảng phản hồi
create table Feedbacks (
	FeedbackId int not null primary key identity, -- khoá chính
	FeedbackCatalogId int not null foreign key references FeedbackCatalogs(FeedbackCatalogId), -- khoá ngoại danh mục phản hồi
	FeedbackFullname nvarchar(250) null, -- họ tên người phản hồi
	FeedbackPhone varchar(20) null, -- số điện thoại người phản hồi
	FeedbackEmail varchar(250) null, -- email người phản hồi
	FeedbackAddress ntext null, -- địa chỉ người phản hồi
	FeedbackContent ntext not null, -- nội dung phản hồi
	FeedbacksTime datetime not null default getdate(), -- thời gian phản hồi
	AdminId int null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên xem phản hồi
	FeedbackStatus int not null default 1 -- trạng thái
)
go

-- bảng giới thiệu
create table Introductions (
	IntroductionId int not null primary key identity, -- khoá chính
	IntroductionContent ntext not null, -- nội dung giới thiệu
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	IntroductionStatus int not null default 1 -- trạng thái
)
go