-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th4 10, 2024 lúc 03:04 PM
-- Phiên bản máy phục vụ: 10.5.20-MariaDB
-- Phiên bản PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `id20821080_dacsanquangba`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Comment`
--

CREATE TABLE `Comment` (
  `SoSao` int(11) DEFAULT NULL,
  `NoiDung` varchar(200) DEFAULT NULL,
  `ThoiGian` datetime DEFAULT NULL,
  `LuotThich` int(11) DEFAULT NULL,
  `LuotDislike` int(11) DEFAULT NULL,
  `TrangThai` bit(1) DEFAULT NULL,
  `IDDacSan` char(7) NOT NULL,
  `IDUsers` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `Comment`
--

INSERT INTO `Comment` (`SoSao`, `NoiDung`, `ThoiGian`, `LuotThich`, `LuotDislike`, `TrangThai`, `IDDacSan`, `IDUsers`) VALUES
(4, 'Món ăn rất tuyệt', '2024-04-10 08:30:00', 0, 0, b'1', 'DSAN001', 'USER001'),
(3, 'Mười điểm cho shop', '2024-04-10 09:30:00', 0, 0, b'1', 'DSAN001', 'USER002'),
(5, 'Vị rất đậm đà', '2024-04-10 10:00:00', 0, 0, b'1', 'DSAN001', 'USER003'),
(4, 'Món ăn rất ngon, hợp khẩu vị', '2024-04-10 13:40:00', 0, 0, b'1', 'DSAN001', 'USER004');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `DacSan`
--

CREATE TABLE `DacSan` (
  `IDDacSan` char(7) NOT NULL,
  `TenDS` varchar(50) DEFAULT NULL,
  `MoTa` varchar(1000) DEFAULT NULL,
  `Chay` bit(1) DEFAULT NULL,
  `Sao` double DEFAULT NULL,
  `Avatar` varchar(400) DEFAULT NULL,
  `TrangThai` varchar(20) DEFAULT NULL,
  `IDLoaiDS` char(7) DEFAULT NULL,
  `IDTinh` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `DacSan`
--

INSERT INTO `DacSan` (`IDDacSan`, `TenDS`, `MoTa`, `Chay`, `Sao`, `Avatar`, `TrangThai`, `IDLoaiDS`, `IDTinh`) VALUES
('DSAN001', 'Xôi nếp nương Mai Châu', 'Nếp nương Mai Châu là giống nếp quý của đồng bào người Thái ở Hòa Bình. Những hạt nếp thơm được trồng trên những thửa ruộng bậc thang, là kết tinh những gì tinh túy nhất của đất trời Hòa Bình. Nếp được đồ trong chõ gỗ và đồ 2 lửa nên dẻo thơm đặc biệt ngay cả khi để nguội. Đến Hòa Bình, bạn nhớ thưởng thức xôi nếp nương Mai Châu ngũ sắc nhé!', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-hoa-binh-10.jpeg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH001'),
('DSAN002', 'Cam quýt Cao Phong', 'Ngoài những món ăn và thức uống đặc sản, du khách đừng quên thưởng thức và mua về làm quà các loại trái cây đặc sản Hòa Bình. Nổi tiếng nhất trong số đó chính là cam, quýt Cao Phong. Nào là cam lòng vàng; cam xã Đoài, quýt Tân Châu… loại nào cũng có chung đặc điểm vỏ mỏng, vị ngọt, ít hạt và tươi lâu. Thời gian thu hoạch kéo dài từ tháng 9 đến tháng 4 năm sau, tháng 11 là thời điểm thu hoạch cam chính vụ', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-hoa-binh-9-1024x512.jpeg?tr=dpr-2,w-675', '1', 'LOAI004', 'TINH001'),
('DSAN003', 'Sữa Mộc Châu', 'Với khí hậu mát mẻ và những thảo xanh trải dài bất tận, Mộc Châu phát triển nghề chăn nuôi bò sữa từ bao đời nay. Ở Mộc Châu có nhiều nông trường bò quy mô lớn. Vì vậy, một trong những trải nghiệm bạn không nên bỏ lỡ là check-in các nông trường và thưởng thức hương vị tươi ngon của sữa Mộc Châu. Ngoài ra, bạn cũng có thể mua sữa đông, sữa chua, váng sữa, bánh sữa, bơ sữa…về làm quà.', b'0', 0, 'https://www.kidsplaza.vn/blog/wp-content/uploads/2020/12/bai-2-dantri-186-finaldocx-1560668541913.png', '1', 'LOAI002', 'TINH002'),
('DSAN004', 'Tỏi cô đơn Phù Yên', 'Tỏi cô đơn là giống tỏi một nhánh, nhánh tỏi to, màu tía, mùi thơm và vị cay nhẹ nhưng không hăng. Giống tỏi này ngon hơn và đắt hơn các giống tỏi khác. Tại Phù Yên hiện chỉ có xã Tường Phù, Gia Phù, Tường Thượng là trồng được tỏi cô đơn. Tỏi là thứ gia vị không thể thiếu trong căn bếp của gia đình Việt nên rất thích hợp để mua về làm quà.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-son-la-7-1024x768.jpeg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH002'),
('DSAN005', 'Thịt trâu gác bếp', 'Thịt trâu gác bếp chắc chắn là đặc sản Điện Biên mà mọi du khách nên thử một lần. Thịt trâu này được tuyển chọn cực kỳ kỹ lưỡng, đem về lọc hết gân, bạc nhạc, sau đó mới thái ra và ướp gia vị từ 2-3 tiếng. Cuối cùng mang lên treo ở gác bếp để hun cho thịt chín từ từ.', b'0', 0, 'https://benhphoitacnghen.vn/wp-content/uploads/2024/02/Thit-trau-gac-bep.jpg', '1', 'LOAI001', 'TINH003'),
('DSAN006', 'Chè Tuyết Tủa Chùa', 'Nếu bạn chưa biết thì Chè Tuyết còn có tên gọi khác là chè Shan Tuyết, là một lại chè mọc ở độ cao 1400m, sống ở nơi khí hậu lạnh suốt năm, thân gỗ cổ thụ. Chè có màu vàng óng, khi uống vào sẽ có vị đắng nhưng lại ngọt dần và có mùi thơm cực kỳ đặc trưng. Chè Tuyết Tủa Chùa là một trong những đặc sản Điện Biên vô cùng nổi tiếng, chè được nhiều du khách lựa chọn để thưởng thức hay làm quà biếu. Du khách nên lựa chọn các địa chỉ uy tín khi mua chè để đảm bảo chất lượng nhé.', b'1', 0, 'https://www.dienbien.gov.vn/portal/Photos/2022-03-23/9d68c7ad93e2114dS.jpg', '2', 'LOAI002', 'TINH003'),
('DSAN007', 'Xôi tím Lai Châu', 'Nhắc đến các món ăn đặc sản Lai Châu không thể bỏ qua món xôi tím ngon trứ danh. Xôi có vị dẻo, thơm mùi nếp nươn, vừa có màu tím bắt mắt. Đây là món ăn truyền thống được đôi bàn tay khéo léo của người phụ nữ Thái, Dáy… làm với những bí quyết riêng. Nguyên liệu để làm xôi bao gồm: nếp nương hạt to thơm dẻo, tinh túy của vùng đất Lai Châu và màu tím của xôi được làm nên từ cây khẩu cắm (loại cây chỉ trồng được ở vùng núi). Sau khi đồ chín, xôi sẽ có màu tím tươi, hạt xôi bóng dẻo mà không dính, mùi thơm của nếp lan tỏa hấp dẫn. Thực khách có thể ăn xôi tím nóng cùng với thịt lợn gác bếp.', b'1', 0, 'https://cdn3.ivivu.com/2023/06/Xoi-Tim-lai-chau-ivivu.jpg', '1', 'LOAI001', 'TINH004'),
('DSAN008', 'Canh tiết lá đắng', 'Nguyên liệu để nấu canh lá đắng bao gồm: ít phổi lợn băm nhỏ, một miếng tiết và vài thứ rau thơm cùng với nắm lá đắng (có thể lá tươi hoặc đã phơi khô) vò nát. Đun nước sôi rồi cho tất cả nguyên liệu vào nấu chín kỹ là bạn đã có một bát canh lá đắng thơm ngon để thưởng thức. Lần đầu thưởng thức món canh này, bạn sẽ thấy khó ăn bởi vị đắng, chát tê đầu lưỡi, nhưng nếu đã ăn quen rồi, bạn sẽ cảm nhận vị ngọt, bùi, thơm ngậy. Canh lá đắng còn có tác dụng giải rượu và chữa được bệnh về tiêu hóa.', b'1', 0, 'https://cdn3.ivivu.com/2023/06/canh-ti%E1%BA%BFt-l%C3%A1-%C4%91%E1%BA%AFng-ivivu.jpg', '1', 'LOAI001', 'TINH004'),
('DSAN009', 'Gà nướng lá mắc mật', 'Dạo quanh chợ phiên Mù Cang Chải, du khách sẽ ngay lập tức bị hấp dẫn bởi hương thơm hấp dẫn tỏa ra từ những quán gà nướng. Gà Tây Bắc được ướp gia vị kỹ càng, lá móc mật được nhồi vào trong bụng sau đó mới mang nướng chín trên bếp than hồng. Thịt gà được nướng nguyên con nên giữ nguyên độ ngọt tự nhiên. Thịt gà chắc nhưng không dai, khi ăn chấm với chẳm chéo “ngon quên sầu”.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-yen-bai-2-1024x597.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH005'),
('DSAN010', 'Mật ong hoa nhãn', 'Văn Chấn là huyện có diện tích trồng nhãn lớn nhất Yên Bái. Khi hoa nhãn nở rộ thì ngoài bọ xít, các loài ong cũng kéo nhau về hút mật. Người Văn Chấn tận dụng “tài nguyên thiên nhiên” này để nuôi ong lấy mật. Mật ong hoa nhãn vàng tươi, trong và thoang thoảng hương hoa nhãn.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-yen-bai-9-1024x683.jpeg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH005'),
('DSAN011', 'Bánh tai', 'Muốn thưởng thức trọn vẹn cái đẹp, cái riêng của hành trình du lịch Phú Thọ, hãy một lần nếm thử món bánh tai đậm đà phong vị của quê hương. Bánh tai hay còn gọi là bánh Hòn, chính là một trong những đặc sản Phú Thọ nổi tiếng nhất của nơi đây. Sự dẻo thơm của bột gạo kết hợp hài hòa cùng phần nhân thịt lợn đậm đà, béo ngậy, hòa quyện cùng nhiều nguyên liệu khác tạo nên một món ăn tuy dân dã nhưng rất được ưa thích và trở thành món ăn sáng phổ biến của người dân địa phương.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-phu-tho-3-1024x500.jpg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH006'),
('DSAN012', 'Bưởi Đoan Hùng', 'Đoan Hùng, nơi được biết đến là vùng có những vườn bưởi chín vàng, trĩu quả bên dòng sông Lô nổi tiếng. Từ xa xưa, nơi đây đã được mệnh danh là “lãnh địa” của giống bưởi quý, rạng danh đặc sản vùng Đất Tổ. Những khu vực trồng nhiều bưởi nhất chính là Chí Đám, Bằng Luân, Khả Lĩnh, Phúc Lai, Quế Lâm, Yên Kiện, Phương Trung. Bạn có thể đến đây để thưởng thức và mang quà làm quà cũng rất tuyệt đấy! Thường được thu hoạch vào lúc chớm thu, tháng 8 âm lịch đến hết năm. Bưởi Đoan Hùng sau khi hái, để càng lâu, bưởi càng ngọt mà không bj khô.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-phu-tho-8.jpg?tr=dpr-2,w-675', '1', 'LOAI004', 'TINH006'),
('DSAN013', 'Lợn cắp nách', 'Lợn cắp nách là giống lợn có kích thước nhỏ, mỗi khi mang lợn đi bán, người dân bản địa thường cắp lợn vào nách nên từ đó nó có tên gọi lợn cắp nách. Người dân nuôi lợn bằng các loại rau và thức ăn thừa, không sử dụng cám tăng trọng nên lợn chậm lớn, thịt chắc và thơm ngon tuyệt vời.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-lao-cai-3.jpeg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH007'),
('DSAN014', 'Cá hồi Sapa', 'Cá hồi Sapa là một đặc sản Lào Cai mà du khách nào đến đây cũng muốn thưởng thức bằng được. Cá hồi được các nhà hàng chế biến thành nhiều món ăn hấp dẫn như sashimi, lẩu, nướng, nấu canh chua, …Ngoài thưởng thức các món ăn ngon chế biến từ cá hồi, du khách cũng có thể mua ruốc cá hồi về làm quà cho người thân, bạn bè.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-lao-cai-1-1-1024x683.jpeg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH007'),
('DSAN015', 'Bánh Gai Chiêm Hóa', 'Là loại bánh gai vô cùng đặc trưng của dân tộc Tày tại vùng Chiêm Hoá, Tuyên Quang. Bánh gai sẽ thường được làm vào dịp rằm tháng 7 mỗi năm và dâng lên ông bà tổ tiên nhằm thể hiện lòng biết ơn, hiếu thảo của con cháu đến với các bậc tiền nhân trong dòng họ. Với bánh gai Chiêm Hóa ta sẽ có lớp nhân đậu xanh và dừa cực kỳ thơm ngon, bánh có mùi đường mía cùng lá gai và lá chuối khô đặc trưng. Ăn vào có vị ngọt thanh nên không lo bị ngấy hay khé cổ. Bánh gai Chiêm Hoá chắc chắn là đặc sản Tuyên Quang nhất định phải thử 1 lần.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-tuyen-quang-2-1024x698.jpeg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH008'),
('DSAN016', 'Rượu ngô Na Hang', '', b'1', 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPIa5IaNnbWHtPfqdn_aSN85dN07-m2fvlWy2djl2WVA&s', '1', 'LOAI002', 'TINH008'),
('DSAN017', 'Thắng Dền', 'Nguyên liệu chính của Thắng Dền là gạo nếp hương huyện Yên Minh. Đây là loại gạo có hình dạng to, trắng tròn và chắc hạt, khi nấu sẽ dẻ thơm và có vị ngon ngọt. Bên trong những viên nếp dẻo, đặc là những loại nhân khác nhau, từ đậu xanh, đậu đỏ,... Khi cho vào miệng nhai, bạn sẽ cảm nhận được sự dẻo dẻo và vị ngọt nhẹ cùng hương thơm gạo nếp thoang thoảng. Để thưởng thức ngon miệng hơn, bạn có thể thêm một chút nước đường hoa mai nấu gừng hoặc nước cốt dừa, vừng và lạc rang nhé.', b'1', 0, 'https://mia.vn/media/uploads/blog-du-lich/thang-den-ha-giang-mon-an-choi-nuc-long-bao-thuc-khach-04-1642637283.jpg', '1', 'LOAI003', 'TINH009'),
('DSAN018', 'Phở chua', 'Trước kia, phở chua là món điểm tâm của người Trung Quốc. Sau đó mới du nhập vào Việt Nam, đặc biệt là các vùng miền núi phía Bắc như Hà Giang, Lạng Sơn, Bắc Kạn,... Nguyên liệu chính của phở chua là gạo nếp hương và nước sốt chua ngọt kết hợp với thịt xá xíu, thịt quay, lạp xưởng và ớt xào. Để có mùi vị đặc trưng của món phở chua, người dân thường làm nước sốt chua ngọt từ hỗn hợp giấm pha đường, bột sắn và các gia vị miền núi. Khi ăn, du khách có thể dùng kèm với rau húng thơm, tỏi tươi, đu đủ nạo,... để có thể thưởng thức trọn vẹn đặc sản Hà Giang.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-thanh-hoa-6.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH009'),
('DSAN019', 'Tôm chua Ba Bể', 'Tôm chua Ba Bể là một món đặc sản Bắc Kạn cực kỳ dân dã, người dân địa phương thường dùng tôm chua trong nhiều bữa ăn hàng ngày. Do ngày xưa tôm tại khu vực hồ Ba Bể đánh bắt được rất nhiều, do dùng không hết nên nhiều người đã chế biến theo cách này để giữ được lâu hơn. Tôm chua có vị ngon cực kỳ, vừa béo béo lại cay cay vô cùng hấp dẫn. Nếu có dịp ghé Bắc Kạn thì nhớ phải thử nha.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-bac-kan-1-1024x932.jpeg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH010'),
('DSAN020', 'Bánh coóc mò', 'Bánh coóc mò trong tiếng Tày có nghĩa là sừng bò, nghe là biết đã hình dáng món bánh này ra sao rồi phải không nào! Món đặc sản Bắc Kạn chắc chắn sẽ khiến những ai thưởng thức phải khó quên bởi vị dẻo thơm, đậm đà của chúng. Nguyên liệu làm bánh thường sẽ từ nếp thơm, lạc đỏ và sử dụng lá dong để gói bánh. Những chiếc bánh coóc mò sẽ là món quà biếu cực kỳ hợp lý khi du lịch đó nha.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-bac-kan-6-1024x683.jpeg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH010'),
('DSAN021', 'Chè Tân Cương', 'Đặc sản Thái nguyên không thể không nhắc đến chè Tân Cương. Nổi tiếng là một vùng chè nhất nhì cả nước, Thái Nguyên luôn được mệnh danh là “đệ nhất danh trà” vì nơi đây có thổ nhưỡng và khí hậu tốt giúp cho cây chè sinh trưởng tốt, búp chè mập, cũng vì vậy mà Thái Nguyên trở thành nơi cung cấp chè chất lượng và hảo hạng nhất. Chè Tân Cương có màu xanh ngả vàng nhạt và sánh, hương cốm thanh khiết, nước chè trong, khi uống sẽ cảm nhận được vị chát nhưng hậu có vị ngọt thanh khiến cho chè ở đây có cảm giác rất khác so với chè ở các vùng khác. Nếu ai đến Thái Nguyên nhưng không thử qua chè Tân Cương thì quả là một thiếu sót lớn.', b'1', 0, 'https://www.sieuthianhduong.com/images/product/theme_1595925863_theme_gallery_z1996264580951_1af7544f07404598ee64778d5c023415.jpg', '1', 'LOAI002', 'TINH011'),
('DSAN022', 'Cơm lam Định Hóa', 'Đến với Định Hóa, du khách không chỉ được tìm về những sự kiện lịch sử trọng đại của dân tộc mà còn được đắm mình trong các lễ hội độc đáo của đồng bào dân tộc thiểu số, được thưởng thức các sản vật địa phương quyến rũ. Cơm lam là một trong những món ăn giản dị của đồng bào dân tộc thiểu số Định Hóa nhưng có sức hấp dẫn lạ lùng bởi sự giao hòa của nước của lửa và những ống nứa non. Cơm lam là một món ăn giản dị của người dân Định Hóa, giản dị bởi nó gắn với những con suối nơi đầu nguồn và nương lúa bên sườn đồi, những vạt rừng tre nứa xanh ngút của đất ATK một thủa nhưng khiến du khách khó quên nếu có dịp thưởng thức.', b'1', 0, 'https://cms.thainguyen.vn/documents/130266/13804972/Com+lam2.png/92b14173-4b44-4b8d-a36c-6dab1d72f61c?t=1700387760736', '1', 'LOAI001', 'TINH011'),
('DSAN023', 'Lạp Sườn hong khói Cao Bằng', 'Với công thức ướp thịt đặc biệt, người dân Cao Bằng đã tạo ra món lạp sườn hong khói là đặc sản Cao Bằngvang danh. Lạp sườn được làm từ thịt và lòng của lợn thả vườn, ướp với hương gừng cùng quả và lá mác mật. Sau đó lạp xưởng được hong khô nhiều ngày bằng khói bếp nên rất chắc thịt và thơm ngon. Đến Cao Bằng, bạn có thể dễ dàng thưởng thức món lạp sườn ở khắp nơi từ những nhà hàng nổi tiếng đến những hộ gia đình. Ngoài ra, lạp sườn hong khói còn được xem là món quà thích hợp để bạn tặng người thân, bạn bè và đồng nghiệp sau chuyến thăm Cao Bằng.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-cao-bang-4.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH012'),
('DSAN024', 'Bánh trứng kiến', 'Bánh trứng kiến là đặc sản của người Tày sinh sống tại Cao Bằng. Bánh có tên là trứng kiến vì nguyên liệu chính để làm bánh là trứng kiến. Bánh chỉ có thể làm vào khoảng thời gian từ tháng 04 đến tháng 05 dương lịch vì đây là thời điểm có trứng kiến nhiều nhất. Bánh gồm có phần vỏ làm từ bột nếp và phần nhân là trứng kiến non được phi với mỡ heo thơm ngon béo ngậy. Bánh trứng kiến là một trong những đặc sản ở Cao Bằng bởi hương vị vừa lạ vừa ngon, được nhiều người yêu thích và chọn làm quà tặng khi đến thăm Cao Bằng.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-cao-bang-6.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH012'),
('DSAN025', 'Nem nướng Hữu Lũng', 'Nếu bạn muốn mua đặc sản Lạng Sơn làm quà, thì nem nướng Hữu Lũng sẽ là lựa chọn không thể bỏ qua. Món ăn được chế biến từ nguyên liệu chính là thịt lợn và bì lợn cắt nhỏ, kết hợp cùng thính, gói lại bằng lá chuối tươi. Sau một thời gian ngắn nem sẽ lên men và có vị chua chua, khi muốn ăn chỉ cần bắc lên bếp nướng là đã có được món ăn thơm ngon, hấp dẫn. Món ăn vừa có vị chua, kèm thêm hương vị được gia giảm vừa phải, khi ăn sẽ có cảm giác mềm và dai dai của thịt lợn cùng bì lợn.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-lang-son-4.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH013'),
('DSAN026', 'Bánh ngải', 'Đây là một loại bánh nổi tiếng tại vùng núi phía Bắc, đường làm ra từ lá ngải non cùng nước tro sạch cho nhừ, rửa sạch, bỏ xơ và giã nhuyễn bằng cối. Phần xôi nấu chín cũng sẽ được giã nhuyễn cùng lá ngải thành bột mịn. Sau đó một mẻ bánh ngải ra đời với màu xanh độc đáo. Bên cạnh đó, bánh còn có hương vị đặc trưng, độ thơm dẻo hấp dẫn giúp du khách khó mà quên được dù mới thưởng thức lần đầu. Du khách có thể mua món bánh đặc sản Lạng Sơn với giá 4,000 đến 7,000 VND/ cái. Địa điểm tham khảo này tại các phiên chợ Lạng Sơn hoặc tại các điểm du lịch.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-lang-son-7.jpg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH013'),
('DSAN027', 'Vải thiều Lục Ngạn', 'Khi được hỏi \"Bắc Giang có đặc sản gì?\", vải thiều sẽ là cái tên đầu tiên được du khách nghĩ đến khi nói về đặc sản Bắc Giang. Có nhiều địa phương của nước ta trồng vải thiều. Nhưng vải thiều Lục Ngạn thơm ngon, đậm vị, vỏ mỏng, hạt nhỏ, cùi dày khiến người ta ăn hoài không chán. Nếu đến Bắc Giang không trùng mùa vải, du khách có thể mua và thưởng thức đặc sản vải sấy khô với hương vị đặc trưng nguyên vẹn. Mùa vải từ đầu tháng 6 cuối tháng 7.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-bac-giang-1.jpg?tr=dpr-2,w-675', '1', 'LOAI004', 'TINH014'),
('DSAN028', 'Bánh đa Thổ Hà', 'Bánh đa Thổ Hà được người dân xã Vân Hà (Việt Yên, Bắc Giang) sản xuất từ năm 1990 và đến nay đã trở thành đặc sản nức tiếng gần xa. Bánh đa nem Thổ Hà mềm dai, không tẩy trắng bằng hóa chất. Bánh đa nướng Thổ Hà giòn tan, bùi bùi vị lạc vừng. Cả 2 loại đều được làm từ nguyên liệu tuyển chọn nên thơm ngon khác biệt.', b'1', 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5y06_oh3OCPtT1QNxGSS8jtB6bYUoKbeqF697IvdiJw&s', '1', 'LOAI003', 'TINH014'),
('DSAN029', 'Phở Hà Nội', 'Phở Hà Nội dễ phải có từ cách đây gần trăm năm rồi. Đây là món ăn truyền thống lâu đời, mang hương vị riêng của đất Bắc. Bạn có thể tìm tại bất kỳ đâu ở Việt Nam, nhưng chỉ khi ăn món này ở Hà Nội thì mới ngon. Phở là sự hòa quyện tinh tế giữa nước dùng béo ngậy, rau thơm thanh mát, thịt bò/thịt gà thơm lừng cùng nhiều nguyên liệu khác. Sự khác biệt dễ nhận thấy nhất giữa phở Hà Nội và phở trong Nam chính là bánh phở dẹp và to hơn, đồng thời, một số nơi sẽ ăn kèm phở với quẩy. Ngoài phở tái chín truyền thống, Hà Nội còn nổi tiếng với món phở cuốn, phở sốt vang hay phở tái lăn.', b'0', 0, 'https://sakos.vn/wp-content/uploads/2023/10/pho-ha-noi-09_1677399161.jpg', '1', 'LOAI001', 'TINH015'),
('DSAN030', 'Bún Thang', 'Món ăn này được người dân Hà Nội xưa ăn vào các dịp quan trọng như lễ tết. Bún thang Hà Nội có thể gọi là “đệ nhất cầu kỳ” vì phải dùng đến 20 nguyên liệu để làm nên tô bún thơm ngon. Thành phần chính bao gồm: trứng gà chiên mỏng xắt nhỏ, lườn gà xé, giò lụa xắt mỏng, tôm, mực, rau răm… tất cả tạo nên tô bún sắc màu đẹp mắt và ngon miệng.', b'0', 0, 'https://sakos.vn/wp-content/uploads/2023/10/bun-thang-1.jpeg', '1', 'LOAI001', 'TINH015'),
('DSAN031', 'Miến trộn Hà Thành', 'Nếu là một người yêu thích ẩm thực Hà Nội, bạn không thể bỏ qua món ăn quen thuộc ở đây – miến trộn Hà Nội. Một thức quà bình dị nhưng ngon với một vài biến tấu ẩm thực để làm hài lòng nhiều người.', b'0', 0, 'https://sakos.vn/wp-content/uploads/2023/10/chop-lay-7-quan-mien-tron-ha-noi-ngon-dinh-cao-nhat-dinh-phai-thu-1639362043.jpg', '1', 'LOAI001', 'TINH015'),
('DSAN032', 'Bún chả Hà Nội', 'Thoạt nhìn, bạn có thể nghĩ ngay đến món bún thịt nướng trong Nam, nhưng không nhé, hương vị nước chấm của bún chả Hà Nội hoàn toàn khác biệt.', b'0', 0, 'https://sakos.vn/wp-content/uploads/2023/10/bun-cha-ha-noi-tu-lam.jpg', '1', 'LOAI001', 'TINH015'),
('DSAN033', 'Bún đậu mắm tôm', 'Bún đậu mắm tôm là món ngon Hà Nội “gây bão” một thời với nguyên liệu hết sức dân dã. Trong một phần bún đậu đáp ứng được các yêu cầu về “hương” và “sắc” thì phải có đầy đủ các nguyên liệu sau: bún tươi, đậu phụ chiên giòn, chả cốm, dồi lợn, lòng lợn, thịt chân giò, rau sống,… và một chén mắm tôm cổ truyền Thanh Hóa, hòa nước cốt tắc chua ngọt, cay cay.', b'0', 0, 'https://sakos.vn/wp-content/uploads/2023/10/bun-dau-mam-tom.jpg', '1', 'LOAI001', 'TINH015'),
('DSAN034', 'Cá thính Lập Thạch', 'Nhắc đến đặc sản Vĩnh Phúc thì không thể không kể đến món cá thính đặc sản Lập Thạch do người dân Văn Quán sáng tạo ra. Nguồn gốc của món ăn này xuất phát từ mùa mưa, nước lũ tràn về trong khoảng thời gian từ tháng 5 đến tháng 10 âm lịch nên người dân có rất nhiều cá. Do không ăn hết, phơi khô và bảo quản khó khăn, chợ thì xa và không có thuyền bè nên người dân đã lấy cá tươi cùng với ngô, đậu rang, muối và lá ổi kết hợp thành món cá thính.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-vinh-phuc-2-1024x639.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH016'),
('DSAN035', 'Dứa Tam Dương', 'Đã kể đến đặc sản Vĩnh Phúc thì không thể nào không nhắc đến dứa Tam Dương. Tại tỉnh Vĩnh Phúc, Tam Dương là huyện trồng nhiều dứa nhất. Dứa được trồng tại Tam DƯơng sẽ có những đặc trưng riêng như dứa mỡ gà có vị chua, màu vàng nhạt, dứa hướng đạo có vỏ nhỏ, vị ngọt, chua nhẹ, ruột giòn còn dứa mật thì nhiều nước, rất ngọt,... Mùa dứa bắt đầu vào khoảng tháng 4 và chín rộ vào tháng 6, tháng 7 hàng năm', b'1', 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGafHz46bop5hKTsV-6O7CjuBDjyv9FFmM1MDZYenFVA&s', '1', 'LOAI004', 'TINH016'),
('DSAN036', 'Bánh phu thê Đình Bảng', 'Một đặc sản Bắc Ninh tiếp theo phải kể đến là món bánh phu thê nổi tiếng khắp cả nước ta, là một loại bánh cổ truyền, ở mỗi vùng miền sẽ có công thức làm bánh khác nhau. Nhưng nói đến cái gốc nơi bánh phu thê được ra đời là tại Đình Bảng Bắc Ninh. Hương vị bánh phu thê ngọt dịu, kết hợp giữa sự dẻo thơm của nếp cái hoa vàng, thường được gói với lá chuối làm dậy thêm mùi thơm của bánh. Bên trong bánh là nhân đậu xanh ngọt bùi, theo quan niệm lá gói màu xanh tượng trưng cho sự thuỷ chung và lạt buộc sẽ se duyên, kết nối tình cảm vợ chồng thêm sắc son hơn.', b'1', 0, 'https://cdn3.ivivu.com/2022/12/banh-phu-the-dinh-bang-ivivu-13.jpg', '1', 'LOAI003', 'TINH017'),
('DSAN037', 'Bánh khúc làng Diềm', 'Ngôi làng Diềm không chỉ nổi tiếng là một khu làng cổ nổi tiếng với những câu ca quan họ, mà đây còn là nơi có món bánh Khúc trứ danh, một loại bánh thường xuất hiện trong những dịp lễ tết, ngày rằm, hội hè, mời khách quý phương xa,... Bánh khúc Làng Diềm là sự kết hợp giữa những nguyên liệu đơn giản nếp cái hoa vàng, lá khúc và nhân bánh đậu xanh thịt mỡ. Tạo ra một món bánh dân dã, mộc mạc nhưng với hương vị béo bùi của nhân đậu xanh và thịt mỡ, thêm vào vị thơm ngào ngạt của lá khúc, vị dẻo của vỏ bánh, khiến bạn ấn tượng mãi.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-bac-ninh-1.jpg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH017'),
('DSAN038', 'Bánh đậu xanh', 'Đến với Hải Dương du khách chắc chắn không thể bỏ qua bánh đậu xanh mềm và ngọt lịm. Một thức bánh ăn vặt thưởng thức với trà cực cuốn hút. Bánh được làm ra từ những hạt đậu xanh tươi xay nhuyễn cùng đường, dầu thực vật. Sau đó sẽ được cắt thành những miếng vuông, kích thước nhỏ gói trong giấy bạc hoặc giấy thấm dầu chuyên dụng để hạn chế dầu mỡ gây ngán khi ăn. Ngay từ khi bóc lớp giấy bọc bên ngoài bạn sẽ ngửi rõ mùi thơm đặc trưng của đậu xanh, khi thưởng thức sẽ cảm nhận rõ vị ngọt và béo bùi nhưng không gây chán. Không gì bắt khi thưởng thức bánh đậu xanh và nhâm nhi một tách trà chiều.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hai-duong-2.jpg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH018'),
('DSAN039', 'Bánh lòng Kinh môn', 'Nếu đến Hải Dương mà không thử qua bánh lòng Kinh môn sẽ là sai sót rất lớn đấy bạn nhé. Bánh được biết đến là loại bánh truyền thống của người dân Hải Dương, thường được dùng trong việc thờ cúng tổ tiên, mang hương vị đặc trưng riêng. Món bánh này được làm từ những nguyên liệu gần gũi với đời sống như: gừng, đậu phộng, bông gạo nếp cái, đường. Khi ăn bạn sẽ thấy vị cay nhè nhẹ của gừng, vị bùi bùi thơm thơm của đậu phộng và bánh dẻo mềm dễ ăn.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hai-duong-4.jpeg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH018'),
('DSAN040', 'Chả gà Tiểu Quan', 'Nhắc đến đặc sản Hưng Yên, chắc chắn không thể thiếu chả gà Tiểu Quan. Đây là món ăn đặc trưng của thôn Tiểu Quan ở Hưng Yên và được thưởng thức trong các dịp lễ Tết. Để nấu được thành phẩm chả gà ngon, người Tiểu Quan phải chọn gà rất kỹ lưỡng và chế biến cẩn thận. Sau đó, mang thịt gà lên giã bằng cối đá. Giã xong thì lấy miếng mo cau phết lên thịt để nướng. Vì nướng bằng than hoa (than củi) nên khi ăn, bạn sẽ cảm nhận được độ thơm ngon tròn vị của món đặc sản này.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hung-yen-3.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH019'),
('DSAN041', 'Tương bần', 'Được sản xuất tại thị trấn Bần Yên Nhân, huyện Mỹ Hào, Hưng Yên, giờ đâu, tương Bần đã trở thành món ăn truyền thống của người Việt Nam. Vì là món ăn dân gian nên cách chế biến tương Bần cũng khá cầu kỳ và đòi hỏi sự khéo léo. Tương Bần có màu vàng sẫm hoặc màu cánh gián, khi rót ra sẽ có kết cấu sánh đặc và rất thơm. Khi ăn, nước tương có vị béo, bùi, đậm đà và có thể để được lâu. Tương Bần đã trở thành nước chấm không thể thiếu khi ăn cùng bánh tẻ, bánh đúc, chấm rau muống, thịt luộc,...', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hung-yen-4.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH019'),
('DSAN042', 'Rượu Lạc Đạo', 'Nhắc đến rượu Lạc Đạo, chắc hẳn ai cũng đã từng nghe đến câu thơ “Đất Lạc Đạo lưu linh say ngất - Rượu Nam bang đệ nhất là đây”. Rượu Lạc Đạo là loại rượu nổi tiếng ở Hưng Yên với nồng độ cồn khá cao và hương vị thơm nồng. Điểm đặc biệt của rượu Lạc Đạo là hương thơm thơm, nồng nhẹ của lúa nếp kết hợp cùng 36 vị men thuốc Bắc gia truyền. Khi thưởng thức, người uống chầm chậm để cảm nhận hết mùi vị của rượu. Ngày xưa, rượu Lạc Đạo được tuyển chọn là đặc sản dùng để dân vua. Theo thời gian, rượu được sản xuất đại trà và truyền thống nấu rượu tại xã Lạc Đạo (Hưng Yên) cho đến tận ngày nay.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hung-yen-6.jpg?tr=dpr-2,w-675', '1', 'LOAI002', 'TINH019'),
('DSAN043', 'Bánh giò Bến Hiệp', 'Nếu được hỏi Thái Bình có đặc sản gì thì món bánh giò Bến Hiệp là món ngon không thể bỏ qua đầu tiên khi đặt chân đến đất Thái Bình. Đây là loại bánh giò lâu đời được chế biến với lớp bột gạo tẻ mỏng, dẻo bên ngoài cùng nhân thịt thơm ngon nóng hổi bên trong. Món ăn này vừa dân dã, vừa quen thuộc với con người Thái Bình, bạn có thể dùng thay các bữa ăn trong ngày hay chỉ đơn giản là ăn vặt. Chiếc bánh giò nhỏ nhỏ nhưng lại mang đến hương vị rất riêng và khẳng định vị trí của mình so với nhiều loại bánh giò ở các tỉnh thành khác.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-thai-binh-1-1024x1024.jpg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH020'),
('DSAN044', 'Ếch om Phượng Tường', 'Một đặc sản Hưng Yên không thể không thử một lần trong đời là món ếch om Phượng Tường. Chỉ cần nghe đến tên gọi thôi, ếch om Phượng Tường cũng đủ làm xao xuyến bao thực khách. Món ăn có nguồn gốc từ làng Phượng Tường, huyện Tiên Lữ, Hưng Yên. Theo kinh nghiệm của người dân địa phương, để có được món ếch om ngon thì họ phải bắt ếch từ tháng 9, tháng 10 trở đi. Vì đây là thời điểm thịt ếch tươi ngon và béo, chắc như thịt gà vậy.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hung-yen-5-1024x683.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH020'),
('DSAN045', 'Cá kho làng Vũ Đại', 'Trước đây, cá kho làng Vũ Đại được chọn làm món tiến Vua. Còn giờ đây, món cá kho niêu đất này theo chân người Việt đi khắp trong Nam, ngoài Bắc và được xuất khẩu sang nhiều nước khác nhau. Cá kho làng Vũ Đại sử dụng nguyên liệu chính là cá trắm đen; thịt ba chỉ và các gia vị đồng quê. Mỗi niêu cá được kho trong nhiều giờ, thậm chí nhiều ngày. Cá kho có màu nâu cánh gián bắt mắt, xương cá mềm nhừ, thịt cá chắc và không còn mùi tanh.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-ha-nam-1-1024x1002.jpeg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH021'),
('DSAN046', 'Bánh cuốn chả Phủ Lý', 'Chưa biết Hà Nam có đặc sản gì hãy đi hỏi người Phủ Lý. Và câu trả lời của họ chắc chắn là bánh cuốn. Bánh cuốn Phủ Lý được tráng 2 lớp mỏng bằng bột gạo tám xoan. Người Phủ Lý làm ra 2 loại gồm bánh tráng mộc và bánh cuốn nhân mộc nhĩ để chiều lòng thực khách. Hành phi thơm lừng được rắc lên trên kích thích vị giác vô cùng. Bánh cuốn Phủ Lý được thưởng thức cùng chả lụa hoặc chả nướng.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-ha-nam-5-1024x614.png?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH021'),
('DSAN047', 'Cơm cháy Ninh Bình', 'Nếu được hỏi Ninh Bình có đặc sản gì, câu trả lời mà bạn sẽ nhận được nhiều nhất chính là cơm cháy Ninh Bình. Một món ngon trứ danh vùng đất cố đô, dù không cao sang, mỹ vị nhưng là một món ăn làm say đắm bao thực khách trong lần đầu thưởng thức. Khác với những món cơm cháy khác, cơm cháy vùng Ninh Bình với nguyên liệu hoà trộn giữa hai loại gạo khô và dẻo, qua nhiều công đoạn phơi khô, chiên phồng để cho ra được những mẻ cơm cháy giòn rụm, thơm phức. Cơm cháy thường sẽ ăn chung với ruốc hoặc hành lá phi thơm, hoặc lạ miệng hơn khi ăn cùng thịt dê, tim cật và nước sốt đậm đà, chắc hẳn, bạn sẽ nhớ mãi vị giòn rụm của cơm cháy.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-ninh-binh-2.jpg?tr=dpr-2,w-675', '1', 'LOAI003', 'TINH022'),
('DSAN048', 'Thịt dê núi', 'Món đặc sản Ninh Bình tiếp theo mà Traveloka muốn gợi ý cho bạn là thịt dê núi Ninh Bình. Ở vùng này, dê được chăn thả trên những ngọn núi, thịt dê săn chắc và thơm ngon, cùng những cách chế biến đặc trưng, du khách sẽ được thưởng thức những món ngon từ dê núi như dê nướng, dê hấp, dê tái chanh, nem dê, dê xào lăn, dê tương gừng,... Đặc biệt hơn cả, hầu hết những nhà hàng hay quán ăn tại Ninh Bình sẽ nổi tiếng với món cơm cháy sốt dê, đây là sự kết hợp hoàn hảo giữa 2 món đặc sản tại nơi đây, tạo nên hương vị lạ miệng, cuốn hút.', b'0', 0, 'https://mia.vn/media/uploads/blog-du-lich/diem-mat-goi-ten-nhung-quan-de-ngon-ninh-binh-nuc-tieng-1640528978.jpg', '1', 'LOAI001', 'TINH022'),
('DSAN049', 'Bánh xíu páo', 'Bánh xíu páo có nguồn gốc từ món bánh bao nướng của người Trung Quốc. Dần dần, nó được người dân Nam Định đây đón nhận, điều chỉnh và phát triển thành thứ bánh đặc sản Nam Định thu hút nhứng du khách có dịp đến thăm thành phố này. Bánh có lớp vỏ mang kết cấu giống bánh trung thu truyền thống, nhân gồm thịt, trứng, mộc nhĩ, mỡ heo cùng các loại gia vị.', b'0', 0, 'https://cdn-i.vtcnews.vn/resize/th/upload/2023/02/24/dac-san-nam-dinh-xiu-pao-13483325.jpg', '1', 'LOAI003', 'TINH023'),
('DSAN050', 'Bánh nhãn', 'Khi bạn đặt chân đến thành phố Nam Định, bạn sẽ không khó để bắt gặp những cửa hàng và biển hiệu bán bánh Xíu Páo - một món ăn thơm ngon nức tiếng đã gắn bó với biết bao thế hệ người dân ở xứ Thành Nam. Xíu Páo là một loại bánh có nguồn gốc từ Trung Quốc, dù không ai nhớ rõ món bánh Xíu Páo đã du nhập vào Nam Định từ khi nào, nhưng hàng thập kỷ qua, nó đã trở thành một món ăn đậm đà tuổi thơ cho rất nhiều thế hệ người dân nơi đây.', b'1', 0, 'https://cdn.tgdd.vn/Files/2019/12/25/1228418/cach-lam-banh-nhan-banh-dau-xanh-gion-tan-thom-lung-an-vat-ngay-tet-12.jpg', '1', 'LOAI003', 'TINH023'),
('DSAN051', 'Bánh đa cua Hải Phòng', 'Để trở thành một trong những món ăn đặc sản Hải Phòng thì bánh đa cua ở đây cũng phải mang một hương vị tuyệt vời riêng. Nước dùng đậm đà, đậm hương thơm, vị béo ngậy từ gạch cua cùng sớ bánh đa dai dai mang hương vị đặc trưng của vùng đất Hải Phòng mà khó nơi nào có được. Khi thưởng thức bánh đa cua, bạn còn có thể ăn kèm với chả giò chiên giòn, thịt sườn, chân giò, riêu gạch cua, đậu phụ, chả lá lốt,...tất cả được kết hợp một cách tuyệt vời.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/08/dac-san-hai-phong-3-1024x683.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH024'),
('DSAN052', 'Nem cua bể', 'Nền ẩm thực miền biển du lịch Hải Phòng luôn làm xao xuyến biết bao tín đồ đam mê ẩm thực bằng nhiều món ngon hấp dẫn và đẹp mắt. Bên cạnh nhiều món ăn trứ danh đất Cảng như Bánh đa cua Hải Phòng...thì Nem cua bể cũng là một đặc sản khiến nhiều người mê mẩn ngay từ lần đầu thưởng thức. Nem cua bể Hải Phòng được chế biến từ nhiều loại hải sản của vùng biển nơi đây như tôm, cua bể cùng nhiều nguyên liệu khác nhau. Trong đó thịt lợn và mộc nhĩ cũng là những nguyên liệu làm nên sự đặc sắc cho món ăn này. Bên ngoài Nem cua bể Hải Phòng khoác lên mình sắc áo vàng ruộm trông cực bắt mắt. Khi ăn vào bạn sẽ cảm nhận rõ nét hương vị của nhiều loại nguyên liệu cùng kết hợp. Tất cả tạo nên một vị rất riêng chỉ có tại Hải Phòng.', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/08/dac-san-hai-phong-4.jpg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH024'),
('DSAN053', 'Chả mực Hạ Long', 'Chả mực là một món ăn quen thuộc trên mâm cơm của rất nhiều gia đình miền biển. Tuy nhiên, không phải nơi nào cũng tạo ra những miếng chả thơm ngon đặc biệt. Mực được dùng làm chả phải là mực mai tươi sống, dày mình, các nguyên liệu khác cũng được lựa chọn cẩn thận và được chế biến theo công thức riêng. Cũng chính vì đặc biệt như vậy mà chả mực Hạ Long trở thành một đặc sản của vùng đất Quảng Ninh mà các du khách trong nước và khắp mọi nơi trên thế giới yêu thích.', b'0', 0, 'https://static.vinwonders.com/production/cha-muc-ha-long-04.jpg', '1', 'LOAI001', 'TINH025'),
('DSAN054', 'Gà đồi Tiên Yên', 'Gà đồi Tiên Yên, còn được biết đến với tên gọi \"gà râu\", là một giống gà nội địa đặc trưng của Việt Nam, có nguồn gốc chính từ huyện Tiên Yên, tỉnh Quảng Ninh. Xuất hiện từ những năm 70 của thế kỷ XX, loại gà này nhanh chóng trở thành một đặc sản Quảng Ninh, thu hút sự chú ý của những người sành ăn. Gà đồi Tiên Yên được người dân nuôi thả tự nhiên nên thịt gà có hương vị thơm ngon, đậm đà, da giòn. Cũng vì được nuôi thả tự nhiên nên thói quen của chúng là cuốc bộ lang thang trên các triền đồi để tìm kiếm thức ăn. Từ đó mà người ta gọi chúng là “gà đồi”.', b'1', 0, 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-quang-ninh-2.jpeg?tr=dpr-2,w-675', '1', 'LOAI001', 'TINH025'),
('DSAN055', 'Bánh cuốn Thanh Hóa', 'Bánh cuốn Thanh Hóa có độ mềm dai nhưng không bị bở. Đây là đặc sản Thanh Hoá mà rất nhiều người yêu thích. Nhân bánh được chế biến từ thịt nạc vai, tôm tươi, hành và mộc nhĩ. Nước mắm được pha với loại mắm ngon, theo tỉ lệ thích hợp, thêm chút cốt chanh, hạt tiêu, ớt tươi. Phần hành khô rắc lên bánh phải là hành được xắt bằng tay, chiên vàng ruộm, không bị mềm. Chính vì vậy dù có thử hết các loại bánh cuốn từ nhiều vùng miền khác nhau, thì vị bánh cuốn xứ Thanh vẫn rất riêng biệt, không thể trộn lẫn.', b'0', 0, 'https://statics.vinpearl.com/banh-cuon-thanh-hoa-9_1629691632_1679923089.jpg', '1', 'LOAI001', 'TINH026'),
('DSAN056', 'Bưởi tiến vua', 'Bưởi tiến vua là giống cây trồng đặc trưng của vùng đất Thọ Xương, Thanh Hoá. Quả bưởi khi còn xanh cũng có màu giống các loại bưởi khác, tuy nhiên khi chín, chúng sẽ chuyển dần sang màu đỏ. Bưởi có mùi thơm, mọng nước, vị ngọt, ăn rất ngon. Xưa kia, giống bưởi quý hiếm này được dùng để tiến vua bởi màu đỏ được cho rằng sẽ đem lại may mắn, thịnh vượng.', b'1', 0, 'https://www.yong.vn/Content/images/foods/buoi-tien-vua-thanh-hoa.jpg', '1', 'LOAI004', 'TINH026'),
('DSAN057', 'Bánh gai Tứ Trụ', 'Bánh gai Tứ Trụ, một đặc sản Thanh Hoá có vị dai của lớp vỏ, thịt bánh dẻo mịn và có mùi thơm cùng vị của lá chuối tiêu. Khi ăn, bạn sẽ thấy vị đậm đà của đậu xanh, vị bùi của lá gai, ngọt của mật mía. Bánh gai Tứ Trụ có nhiều loại nhân cho bạn chọn như nhân đậu xanh, hạt sen, thịt...Trong điều kiện bình thường, bánh để được 1 tuần.', b'1', 0, 'https://tse4.mm.bing.net/th?id=OIP.fBWg2YKZR2A3vUTqHlk10AHaHa&pid=Api&P=0&h=180', '1', 'LOAI001', 'TINH027'),
('DSAN058', 'Cháo lươn Nghệ An', 'Cháo lươn Nghệ An có một hương vị đặc biệt so với các loại cháo khác, từ việc lựa chọn nguyên liệu lươn sạch, béo, vàng óng qua bàn tay khéo léo của người nấu tạo nên một món ăn thanh mát và “thu hút” thực khách thưởng thức. Chất lượng của món cháo lươn sẽ phải đảm bảo, miếng thịt lươn vừa mềm, vừa ngọt mà vẫn giữ được độ dai vừa phải hơn nữa cháo ninh không quá nhão cộng thêm nước làm lươn tạo ra một bát cháo thực sự đặc biệt và hấp dẫn.', b'0', 0, 'https://statics.vinpearl.com/chao-luon-nghe-an-3-1_1630404586.png', '1', 'LOAI001', 'TINH027'),
('DSAN059', 'Bánh gai xứ Dừa', 'Bánh gai là món quen thuộc của nhiều vùng miền, nhưng bánh gai xứ Dừa là đặc sản đặc trưng, thơm ngon khó cưỡng. Từ lâu đã trở thành món đặc sản Nghệ An nói chung và người dân ở xã Tường Sơn huyện Anh Sơn nói riêng. Để có được một chiếc bánh gai ngon đúng vị thì khâu chuẩn bị nguyên liệu cũng đã vô cùng cầu kì từ nếp, đậu xanh, lá gai tươi và dừa khô… Bánh gai xứ Dừa luôn dậy mùi thơm của lá gai, ngọt bùi của nhân đậu tạo nên nét độc đáo ngon lạ miệng cho bao người tới thưởng thức.', b'1', 0, 'https://hanhtrinhdulich.vn/wp-content/uploads/2021/10/banh-gai-xu-Dua-Nghe-An-e1635059487663.webp', '1', 'LOAI003', 'TINH027'),
('DSAN062', 'Lẩu cá khoai Quảng Bình', 'Đây là món ăn được nhiều du khách yêu thích nhờ hương vị thơm ngon và độc đáo riêng mà chỉ có tại Quảng Bình mới có được. Loại cá Khoai có kích thước to dài chỉ bằng một gang tay, thân màu trắng xám pha chút hồng nhạt nhạt. Sau khi được đánh bắt tươi sống, người ta sẽ chọn con có thịt dày để sơ chế. Sau khi loại bỏ phần đầu, đuôi, ruột và vệ sinh sạch sẽ cá sẽ được chặt khúc vừa ăn rồi ướp với tiêu, muối, của nén, thêm các loại gia vị tùy công thức gia truyền của mỗi quán. Cá khoai tươi kết hợp với nước lẩu cá chua chua, ngọt ngọt từ các loại rau củ tự nhiên mang lại hương vị khó quên cho du khách trong lần đầu thưởng thức. Ăn kèm cùng rau trụng, bún tươi thì chắc chắn không còn gì bằng.', b'0', 0, 'https://phongnhaexplorer.com/wp-content/uploads/2021/09/lau-ca-khoai-quang-binh-k.jpg', '1', 'LOAI001', 'TINH028'),
('DSAN063', 'Bánh tét', 'Bánh tét mặt trăng một loại đặc sản Quảng Trị có nguyên liệu từ đậu xanh, gạo nếp ngon và thịt lợn ba chỉ. Món ăn có hương vị dân dã, nhưng vẫn mang đến một hương vị riêng biệt, bánh có mùi thơm khá đặc trưng.', b'1', 0, 'https://i2.wp.com/kenhhomestay.com/wp-content/uploads/2018/12/dac-san-quang-tri-3.jpg', '1', 'LOAI003', 'TINH029'),
('DSAN064', 'Rượu Kim Long', 'Đây là một loại rượu chất lượng có tiếng đối với người dân và du khách. Món đặc sản Quảng Trị này có độ tinh khiết cao, có vị nồng, cay.', b'1', 0, 'https://pic.trangvangvietnam.com/395725168/100_4444.jpg', '1', 'LOAI002', 'TINH029'),
('DSAN065', 'Bún bò Huế', 'Nhắc đến đặc sản Huế chắc chắn không thể bỏ qua món bún bò Huế trứ danh mang hương vị đậm đà, cay nhẹ đặc trưng của người miền Trung mà chẳng có được ở nơi đâu.', b'0', 0, 'https://d13jio720g7qcs.cloudfront.net/images/guides/origin/5f2141d158654.jpg', '1', 'LOAI001', 'TINH030'),
('DSAN066', 'Chè Huế', 'Nhắc đến Huế mà bỏ qua món chè thì quả là thiếu sót bởi đây là món đặc sản làm nên tinh hoa ẩm thực xứ Huế.', b'1', 0, 'https://adventurejourney.vn/upload/image/che-hue.jpg', '1', 'LOAI002', 'TINH030'),
('DSAN067', 'Cháo canh Hà Tĩnh', 'Cháo canh Hà Tĩnh được chế biến từ những sợi bánh canh làm bằng bột mì, có màu trắng đục, ăn vào dẻo, dai, cho hương vị rất đặc biệt, được chan nước dùng hầm bằng xương ngon, ngọt, có thêm vị thơm của hành, vị béo của tôm, vị ngọt của giò lụa… tạo ra hương vị hấp dẫn vô cùng.', b'0', 0, 'https://tse4.mm.bing.net/th?id=OIP.9KoH14iQZ_w-bKAbNPUcCAHaHa&pid=Api&P=0&h=180', '1', 'LOAI001', 'TINH031'),
('DSAN068', 'Bánh ngào Hà Tĩnh', 'Bánh ngào đặc sản Hà Tĩnh là món ăn được làm rất công phu, tỉ mỉ, được làm từ bột nếp phủ với gừng, mật và cả lạc rang, khi ăn cho hương vị thơm lừng, cay cay rất đặc trưng của gừng, vị bùi bùi của lạc, vị ngọt thanh của mật, cùng miếng bánh mềm, dẻo, càng ăn càng thấy ngon miệng.', b'1', 0, 'https://tse3.mm.bing.net/th?id=OIP.IY2WGPeIP8wFsNW5KlJ8ZgHaHa&pid=Api&P=0&h=180', '1', 'LOAI003', 'TINH031'),
('DSAN069', 'Mì Quảng', 'Đến Quảng Nam, bạn sẽ không khó để bắt gặp một quán mì Quảng ở mọi ngóc ngách. Mì Quảng ở đây cũng phổ biến như phở ở Hà Nội vậy. Ngoài nguyên liệu chính là bánh tráng thái mỏng thành sợi và nước dùng, món đặc sản Quảng Nam còn ăn kèm gà, cá lóc, lươn, bò, tôm, ếch… Bánh tráng nướng, đậu phộng và các loại rau thơm làm tăng hương vị món ăn, kích thích vị giác người thưởng thức.', b'0', 0, 'https://hapinut.com/wp-content/uploads/2022/03/mi-quang-quang-nam.jpg', '1', 'LOAI001', 'TINH032'),
('DSAN070', 'Rượu Hồng Đào', 'Rượu Hồng Đào Quảng Nam là loại rượu nổi tiếng thuộc xã Gò Nổi, huyện Điện Bàn đã lâu lắm rồi. Chuyện kể rằng: Gia đình nọ có 2 cha con, người con gái tên Hồng Đào ngoan hiền, đoan trang, trồng dâu, dệt lụa… đăc biệt là nấu rượu ngon nhất làng. Cứ mỗi buổi chiều, sau khi hoàn tất công việc đồng áng, Hồng Đào ươm tơ, dệt lụa, bán rượu giúp đỡ cha. Rượu được làm bằng gạo còn nguyên cám ủ chúng với quả đào chín, đặt bên trong niêu đất nên rất thơm ngon. Chính vì thế, rượu Hồng Đào đã trở nên nổi tiếng và được nhiều người trầm trồ khen ngợi. Không biết bắt đầu từ khi nào, cái tên rượu Hồng Đào đã trở thành đặc sản nổi tiếng của vùng đất di sản Quảng Nam.', b'1', 0, 'https://tse4.mm.bing.net/th?id=OIP.BrcXuzEkuxp4cQiTBMHK8wHaNM&pid=Api&P=0&h=180', '1', 'LOAI002', 'TINH032'),
('DSAN071', 'Bánh khô mè', 'Bánh khô mè còn có tên là bánh bảy lửa vì công đoạn làm bánh phải trải qua ngọn lửa bẩy lần. Bánh được làm từ hỗn hợp bột gạo – nếp, mè, đường. Pha bột gạo với bợt nếp, sau đó cho bột vào khuôn để tạo hình, chưng hấp thủy, nướng trên than hoa rồi được nhúng với một lớp đường mía non, lăn qua mè. Khi ăn bánh có mùi thơm của mè, xốp giòn, vị ngọt đặc trưng của mía non, lớp đường bên trong có thể kéo được thành sợi khi bẻ bánh. Loại đặc sản Đà Nẵng này thường được sử dụng trên các mâm cúng gia tiên trong ngày giỗ, Tết và làm quà tặng.', b'1', 0, 'https://dacsanlamqua.com/wp-content/uploads/2021/05/banh-kho-me-ba-lieu-da-nang-mua-o-dau-tai-da-nang.jpg', '1', 'LOAI003', 'TINH033'),
('DSAN072', 'Bún chả cá', 'Không chỉ có Nha Trang, Quy Nhơn mới có bún chả cá mà đây cũng là một trong những đặc sản Đà Nẵng nổi tiếng. Chả cá làm từ cá tươi đánh bắt từ biển về nên có đôn tươi và rất dai. Phần nước nhân ninh từ xương heo và rau củ quả có độ ngọt thanh tự nhiên. Một tô bún chả cả ở đây luôn đầy ắp với đủ các thành phần: bún, chả cá, cà chua, bí đỏ, hành,… Bạn có thể chọn chả cá hấp hay chiên tuỳ ý.', b'0', 0, 'https://img-global.cpcdn.com/recipes/da2ad5d76d683cf3/1200x630cq70/photo.jpg', '1', 'LOAI001', 'TINH033'),
('DSAN073', 'Món Don', 'Don là một trong những đặc sản Quảng Ngãi ngon nhất để thưởng thức! Con Don là một loài nhuyễn thể, màu vàng nhạt, lớn bằng ngón út, vỏ lại mỏng. Nhon thường sống ở sông Trà và sông Vệ nên từ lâu đã trở thành một món ăn đặc sản phổ biến tại xứ Quảng.', b'0', 0, 'https://dacsanlamqua.com/wp-content/uploads/2021/05/banh-kho-me-ba-lieu-da-nang-mua-o-dau-tai-da-nang.jpg', '1', 'LOAI001', 'TINH034'),
('DSAN074', 'Bánh nổ', 'Đặc sản Quảng Ngãi còn nổi tiếng với rất nhiều loại bánh đa dạng, trong đó phải kể đến bánh nổ. Nhưng mà cứ yên tâm vì loại bánh này không “nổ” đâu mà lo. Bánh có dạng hình hộp chữ nhật, màu trắng ngà, ăn vào có vị ngọt thanh vừa phải, mùi rất thơm. Ăn bánh nổ Quảng Ngãi mà có thêm trà nóng nữa thì đảm bảo ngon tuyệt vời.', b'1', 0, 'https://travelservices-lesvos.com/wp-content/uploads/2019/04/banh-no-quang-ngai-576x420.jpg', '1', 'LOAI003', 'TINH034'),
('DSAN075', 'Bún chả cá Quy Nhơn', 'Bún chả cá Quy Nhơn ghi dấu ấn với hương vị thơm ngon đậm đà. Món ăn có thành phần chính là chả cá dai ngọt và sợi bún nhỏ mềm. Điểm nhấn của món ngon Quy Nhơn này còn đến từ nước dùng ngọt thanh, hài hòa do được nấu từ xương và đầu cá. Tô bún chả cá thường được phục vụ nóng hổi, kết hợp thêm nhiều loại rau thanh mát và nước chấm đậm đà tạo nên hương vị thơm ngon khó cưỡng.', b'0', 0, 'https://bazantravel.com/cdn/medias/uploads/29/29239-bun-cha-ca-670x446.jpg', '1', 'LOAI001', 'TINH035'),
('DSAN076', 'Bánh ít lá gai', 'Bánh ít lá gai Bình Định là một loại bánh đặc sản của vùng đất thượng võ. Thức bánh có hình chóp nón, vỏ dẻo mịn màu lá gai đen nhánh và bên trong là nhân đậu xanh hoặc nhân dừa. Món ăn mang đậm hương vị của ẩm thực Bình Định với sự kết hợp khéo léo của các nguyên liệu thôn quê như: lá gai, nếp, đậu, dừa, gừng và đường cát… Khi ăn, bạn sẽ cảm nhận được độ dẻo thơm của bột nếp, vị ngọt của đường, vị bùi béo của đậu xanh/dừa non và một chút thơm cay của gừng.', b'1', 0, 'https://tse4.mm.bing.net/th?id=OIP.RAlaYKRVxo3dWhejx8H0gQHaJD&pid=Api&P=0&h=180', '1', 'LOAI003', 'TINH035'),
('DSAN077', 'Mắt Cá Ngừ Đại Dương', 'Mắt cá ngừ đại dương là món đặc sản địa phương mà bạn có thể tìm thấy ở khắp Phú Yên, từ nhà hàng cao cấp đến tiệm ăn bình dân. Cách chế biến thông dụng nhất là hấp hoặc hầm mềm cùng thuốc bắc, gia vị, tỏi, hành, ớt... Mỗi phần mắt cá ngừ đại dương hầm thuốc bắc có giá khoảng 40.000đ, gồm 1 đến 2 mắt - có kích cỡ bằng một chén cơm hoặc to hơn. Đây là món ăn bài thuốc giàu dưỡng chất, được người dân Phú Yên lẫn du khách phương xa ưa chuộng.', b'0', 0, 'https://punfood.com.vn/wp-content/uploads/2021/06/mat-ca-ngu-dai-duong-ham-thuoc-bac.jpeg.jpeg', '1', 'LOAI001', 'TINH036'),
('DSAN078', 'Bánh Tráng', 'Nếu bảo bánh tráng phơi sương của Tây Ninh độc đáo thì bánh tráng từ làng Hoà Đa, Phú Yên cũng không hề kém cạnh. Bánh tráng dày nhưng không bị cứng, dẻo thơm, mịn đều - là lựa chọn tuyệt vời cho các món cuốn, gỏi, xào, nộm hay thậm chí là nướng lên ăn không cũng vô cùng thích thú. Chẳng quá lời nếu bảo rằng bánh tráng Hoà Đa là mảnh ghép không thể thiếu khi bàn về nét đẹp văn hoá, ẩm thực Phú Yên.', b'1', 0, 'https://media.mia.vn/uploads/blog-du-lich/Lang-nghe-banh-trang-hoa-da-dac-san-truyen-thong-cua-tinh-phu-yen-02-1637424794.jpg', '1', 'LOAI003', 'TINH036'),
('DSAN079', 'Bún cá Nha Trang', 'Có thể chắc chắn bún cá Nha Trang chính là tập hợp của nhiều loại đặc sản tinh hoa tại vùng đất này, bởi ta sẽ vừa có bún, các loại chả, sứa biển cùng nước lèo ngọt thanh thơm ngon. Món bún cá mang đến hương vị đặc trưng vô cùng khác biệt mà không nơi nào sở hữu. Đảm bảo với hương vị mà món bún cá mang lại sẽ làm không một thực khách nào muốn “buông đũa”.', b'0', 0, 'https://focusasiatravel.vn/wp-content/uploads/2019/12/bun-ca-nha-trang-focusasiatravel.jpg', '1', 'LOAI001', 'TINH037'),
('DSAN080', 'Bánh tráng xoài', 'Bánh xoài Nha Trang luôn nằm trong top những món ăn đặc sản Nha Trang đáng trải nghiệm nhất. Loại bánh này được làm từ nước cốt xoài, tráng thành những miếng bánh mỏng. Khi ăn bạn sẽ cảm nhận rõ hương vị của xoài chín, dẻo thơm và ngọt thanh.', b'1', 0, 'https://tse1.mm.bing.net/th?id=OIP.hNds5j13gC3pPnJuLpXAlgAAAA&pid=Api&P=0&h=180', '1', 'LOAI003', 'TINH037'),
('DSAN081', 'Bún sứa', 'Một trong những món đặc sản Ninh Thuận nổi tiếng chính là bún sứa bình dân quen thuộc. Hương vị đặc trưng của bún sứa được tạo nên từ sự kết hợp hài hòa của sứa tươi, trứng cút, chả cá, bún tươi mềm mịn, hành phi thơm và nước lèo đậm đà.', b'0', 0, 'https://hellophanrang.com/wp-content/uploads/2022/05/z3410546102089_598feeb9b4203608a313b860748a6f96.jpg', '1', 'LOAI001', 'TINH038'),
('DSAN082', 'Nho Ninh Thuận', 'Trong vùng đất nắng gió, nho Ninh Thuận tỏa sắc một vẻ đẹp tinh tế không thể phủ nhận. Những trái nho màu tím chín mọng, thuần khiết và đậm đà mùi hương tự nhiên làm say mê mọi du khách. Vị ngọt của những trái nho, kết hợp với quá trình chăm sóc kỳ lưỡng của người nông dân vườn nho Ninh Thuận, mang đến cho người nhận cảm giác thật tuyệt vời.', b'1', 0, 'https://tse3.mm.bing.net/th?id=OIP.Oh6afiKclDIZW4-aPIQdKgHaEM&pid=Api&P=0&h=180', '1', 'LOAI004', 'TINH038'),
('DSAN083', 'Rượu ghè', 'Rượu ghè là một loại thức uống phổ biến của các đồng bào dân tộc tại nơi đây, không quá khó hiểu khi món này là một trong những đặc sản Kon Tum nổi tiếng nhất. Nguyên liệu cho rượu ghè thường là từ gạo nếp hay sắn kết hợp với một loại men từ lá cây rừng. Rượu ghè có hương vị vô cùng đặc trưng của núi rừng Tây Nguyên do được ủ từ các loại rễ cây nằm sâu trong rừng và rất khó tìm kiếm.', b'1', 0, 'https://nongnghieptaynguyen.vn/banhang/images/content_3.jpg', '1', 'LOAI002', 'TINH039'),
('DSAN084', 'Phở khô', 'Thực khách sẽ cảm thấy vô cùng thú vị khi thưởng thức đến món phở khô tại Kon Tum. Phở khô gồm đến 2 phần; một tô sợi phở khô với các sợi mảnh dai, ăn vào thấy giòn giòn và một tô nước dùng được hầm từ xương heo, gà, bò hầm. Ăn kèm với nước chấm tương và rau sống thanh mát. Nghe thôi đã hấp dẫn rồi phải không!', b'0', 0, 'https://bazantravel.com/cdn/medias/uploads/27/27900-pho-kho-kon-tum.jpg', '1', 'LOAI001', 'TINH039'),
('DSAN085', 'Bánh căn', 'Bánh căn được làm từ bột gạo, đổ vào khuôn nhỏ như khuôn bánh khọt nhưng khuôn không cần tráng qua một lớp dầu hoặc mỡ, nhân bánh gồm hải sản như tôm, mực được đem nướng chín rồi cho ra dĩa thành từng cặp với lớp hành phi bên trên mặt. Ăn bánh căn khi còn nóng mới cảm nhận hết ý vị của chúng.', b'0', 0, 'https://tse3.mm.bing.net/th?id=OIP.aUgFHKobukDvl2Q4eYYgCAHaE8&pid=Api&P=0&h=180', '1', 'LOAI001', 'TINH040'),
('DSAN086', 'Bánh rế Phan Thiết', 'Bánh rế Phan Thiết được làm từ khoai lang và khoai mì có mùi thơm đặc trưng và độ giòn nhất định. Đây sẽ là món quà được nhiều người ưa thích đấy!', b'1', 0, 'https://phanthietvn.com/wp-content/uploads/2013/10/banh-re-phan-thiet-1.jpg', '1', 'LOAI003', 'TINH040'),
('DSAN087', 'Bún mắm cua', 'Bún mắm cua hay còn được gọi là bún cua thúi là một trong những đặc sản Gia Lai gây tò mò nhất với du khách. Loại mắm dùng để nấu nước lèo là mắm ủ từ cua đồng nên có mùi vị đặc trưng, khác lạ. Bún ăn kèm bì heo chiên giòn, bánh phồng tôm, chả nem, thịt ba chỉ. Nhiều người thoạt ngửi mùi lạ của mắm cua thì e dè nhưng đã một lần thưởng thức thì nhớ mãi không quên.', b'0', 0, 'https://nongnghieptaynguyen.vn/banhang/images/content_3.jpg', '1', 'LOAI001', 'TINH041'),
('DSAN088', 'Cà phê Pleiku', 'Gia Lai là tỉnh có diện tích cà phê lớn thứ 4 của nước ta. Thổ nhưỡng và khí hậu Pleiku mang đến chất lượng cà phê thượng hạng. Nhâm nhi ly cà phê thơm lừng sau bữa sáng ở phố núi là trải nghiệm không du khách nào muốn bỏ lỡ. Nếu muốn mua cà phê làm quà, bạn có thể chọn những thương hiệu cà phê rang xay nổi tiếng như Thu Hà; Phiên Phương; Dinh Điền; Thanh Thủy.', b'0', 0, 'https://1.bp.blogspot.com/-KwBLMFl1M0w/Uqqv94kSriI/AAAAAAAAAdc/xv19WjCzMZI/s1600/ca-phe-sach-osaka_s403.jpg', '1', 'LOAI002', 'TINH041'),
('DSAN089', 'Rượu cần', 'Chắc hẳn ai cũng biết rượu cần là thức uống truyền thống quen thuộc tại Tây Nguyên, ngoài ra đây còn là một trong những đặc sản Đắk Lắk nổi tiếng. Rượu được làm từ men lá cây rừng và ủ với nếp nương, sắn nên rất thơm ngon. Phần cần làm bằng cây trúc hoặc cây triêng dài cả mét, sau khi đem phơi khô sẽ rút bỏ lõi. Rượu cần thường được dùng trong các dịp lễ hội hay tiếp đãi khách quý, vừa uống rượu cần vừa thưởng thức các điệu nhảy truyền thống của nơi đây thì còn gì bằng.', b'1', 0, 'https://toplist.vn/images/800px/cong-ty-ruou-can-hai-tay-nguyen-675142.jpg', '1', 'LOAI002', 'TINH042');
INSERT INTO `DacSan` (`IDDacSan`, `TenDS`, `MoTa`, `Chay`, `Sao`, `Avatar`, `TrangThai`, `IDLoaiDS`, `IDTinh`) VALUES
('DSAN090', 'Cá bống kho riềng', 'Cá bống sẽ được bắt từ những dòng thác cao, cá có mình bé, thân trắng và tròn săn chắc. Cá bắt về được làm sạch, ướp mới và chiên vàng, tiếp đó riềng vào và ướp thêm gia vị cho vừa ăn. Cá bống kho xong sẽ có mùi thơm phức, dùng chung với cơm trắng nữa thì quá tuyệt vời.', b'0', 0, 'https://toplist.vn/images/800px/ca-bong-kho-rieng-959508.jpg', '1', 'LOAI001', 'TINH042'),
('DSAN091', 'Cà phê Đắk Nông', 'Vùng đất Tây Nguyên còn được mệnh danh là “thủ phủ cà phê của Việt Nam”. Do vậy, Đắk Nông “nghiễm nhiên” trở thành một trong địa danh sản xuất hàng đầu ở Tây Nguyên với sản lượng khổng lồ. Chính vì lẽ đó mà Đắk Nông sở hữu nhiều cơ sở trồng trọt, chế biến, sản xuất cà phê lớn. Thế nhưng, thương hiệu cà phê nổi tiếng lâu đời và uy tín nhất ở Đắk Nông chỉ có thể là cà phê Đức Lập.', b'1', 0, 'https://toplist.vn/images/800px/ca-phe-dak-nong-1104401.jpg', '1', 'LOAI002', 'TINH043'),
('DSAN092', 'Xoài Đắk Gằn', 'Tưởng chừng vùng đất Đắk Nông có nhiều đồi dốc, sét pha cát chứa đầy sỏi đá sẽ khó trồng trọng loại trái cây nhiệt đới như xoài. Thế nhưng, kỳ lạ thay, xoài Đắk Gằn lại phù hợp để nuôi trồng trên đất bazan cằn cỗi. Hiện nay, xã Đắk Gằn đã thành công khi trồng khoảng 750ha cây xoài với sản lượng vô cùng lớn. Xoài Đắk Gằn có 3 mùa thu hoạch lớn nên du khách có thể đến bất kỳ thời điểm nào cũng có thể ghé thăm và hái trái trực tiếp tại vườn. Xoài có màu vàng khi chính.', b'1', 0, 'https://toplist.vn/images/800px/xoai-dak-gan-1104429.jpg', '1', 'LOAI004', 'TINH043'),
('DSAN093', 'Dâu Tây', 'Với dâu tây Đà Lạt thì đã quá nổi tiếng rồi phải không nào! Đà Lạt là vùng đất trồng rất nhiều loại dâu tây và đây cũng là đặc sản Lâm Đồng rất đáng để thưởng thức. Dâu tây thì vừa bổ lại vừa ngon, ăn vào lại đẹp da nên rất được nữ giới ưa thích. Du khách hiện nay có thể đến trực tiếp các vườn dâu để tự lựa chọn nữa đó, tự mình lựa những trái dâu màu đỏ chín mọng chắc chắn sẽ vô cùng thú vị. Đặc biệt là dâu tây còn có thể chế biến thành nhiều món ăn khác nữa đấy!', b'1', 0, 'https://hinhanhdephd.com/wp-content/uploads/2016/01/hinh-anh-qua-dau-dep-6.jpg', '1', 'LOAI004', 'TINH044'),
('DSAN094', 'Bánh ướt lòng gà', 'Nếu có dịp ghé thăm Đà Lạt thì nhớ phải thử qua món bánh ướt lòng gà nhé! Bánh ướt được tỉ mỉ lựa chọn từ các loại gạo ngon, tráng thật khéo léo sao cho bánh thật đều. Lòng và thịt gà thì lấy từ loại gà thả vườn, phải chọn loại gà không quá lớn thì thịt mới chắc và ngon. Bánh ướt khi ăn vào có vị dẻo và thơm kết hợp với lòng gà béo ngậy chắc chắn sẽ là trải nghiệm tuyệt vời.', b'0', 0, 'https://dulich3mien.vn/wp-content/uploads/2022/01/banh-uot-long-ga-da-lat-1.jpg', '1', 'LOAI001', 'TINH044'),
('DSAN095', 'Cơm tấm', 'Đặc trưng của cơm tấm Sài Gòn là Cơm tấm được làm từ loại gạo tấm, tức là loại gạo hạt nhỏ, có phần hơi nát. Khi ăn, hạt cơm tơi, có màu trắng hơi đục, có phần hơi khô chứ không tròn trịa và trắng dính như loại cơm mà ở nhà ta hay thường ăn. Tuy nhiên loại cơm này khi ăn ta lại cảm thấy ngọt trong cổ, xốp, và vô cùng thơm. Ăn cùng cơm tấm thường có sườn nướng, bì heo, trứng ốp la, trứng hấp, đấy là cơm tấm đúng chất Sài Gòn nhất. Về sau để đa dạng hơn cũng như phục vụ những người ăn, các quán cơm tấm bắt đầu chế biến thêm nhiều món như gà nướng, gà kho, cá kho, xúc xích vv.. tạo nên một bàn ăn với màu sắc vô cùng phong phú.', b'1', 0, 'https://authentiktravel.com/media/ckeditor/vietnamese%20cuisine%20com%20tam.jpg', '1', 'LOAI001', 'TINH045'),
('DSAN096', 'Cafe vĩa hè', 'Café vỉa hè hay còn gọi là café cóc, café lề đường… được xem là một loại hình quán café quen thuộc, đặc trưng của những góc phố Sài Gòn. Những quán café vỉa hè ở Sài Gòn không chỉ thu hút du khách trong nước, mà còn hấp dẫn cả khách du lịch nước ngoài mỗi khi đến Sài Gòn. Nào! Hãy cùng Viet Fun Travel “lượn lờ” khắp Sài Gòn để xem các quán café vỉa hè này có gì thú vị nhé!', b'1', 0, 'https://www.vietfuntravel.com.vn/image/data/Hinh-Sai-Gon/1040.nhung-quan-cafe-via-he-o-sai-gon/nhung-quan-cafe-via-he-o-sai-gon-h5-gigapixel.jpg', '1', 'LOAI002', 'TINH045'),
('DSAN097', 'Bánh Mì Sài Gòn', 'Bánh mì Sài Gòn thường được làm từ bột mì, muối, đường, men, nước và bơ. Bột mì phải được nhào đến khi mịn, sau đó được nướng trong lò nướng đến khi vỏ bánh mì giòn tan và bên trong mềm mịn. Thịt là một thành phần quan trọng của bánh mì Sài Gòn. Thịt được chọn lọc và chế biến theo nhiều cách khác nhau như thịt heo, thịt gà, thịt bò, thịt chả lụa hoặc pate. Thịt sau khi được chế biến sẽ được đặt lên trên bánh mì. Rau cũng là một thành phần quan trọng của bánh mì Sài Gòn. Rau được chọn lọc và rửa sạch trước khi được thái nhỏ và đặt lên trên lớp thịt. Những loại rau thường được sử dụng bao gồm rau diếp, rau mùi và rau sống. Sốt là thành phần cuối cùng cấu tạo nên bánh mì Sài Gòn. Sốt được pha chế từ nhiều loại gia vị như tỏi, ớt, đường, nước mắm và nước chanh. Sốt giúp tăng thêm hương vị cho bánh mì và làm cho bánh mì Sài Gòn thêm phần hấp dẫn.', b'0', 0, 'https://chefjob.vn/wp-content/uploads/2018/08/banh-mi-thit-sai-gon.jpg', '1', 'LOAI001', 'TINH045'),
('DSAN098', 'Bột chiên', 'Nguồn gốc của món bột chiên là từ Trung Hoa gia nhập, vì thế mà xì dầu là thành phần chính của nước chấm. Nhưng qua thời gian, người Việt đã chế biến lại cho hợp khẩu vị hơn với người dân mình. Với vài nguyên liệu đơn giản, bạn cũng có thể tự làm cho mình món ăn vặt nổi tiếng này.', b'1', 0, 'https://cdn.tgdd.vn/Files/2020/06/30/1266676/cach-lam-bot-chien-trung-ngoai-gion-trong-mem-chuan-vi-sai-gon-202206041533314655.jpg', '1', 'LOAI001', 'TINH045'),
('DSAN099', 'Gỏi bưởi - bưởi Tân Triều', 'Gỏi bưởi Đồng Nai thuộc top 100 món ăn đặc sản của Việt Nam bởi sự hài hòa và đặc biệt trong từng hương vị và màu sắc của món ăn. Những tép bưởi ngọt thanh mọng nước, vị the the kết hợp với vị ngọt của tôm sông, thịt và khô xé, thêm một ít đậu phộng và rau thơm làm tăng thêm hương vị cho đĩa gỏi.', b'0', 0, 'https://dasavina.org/wp-content/uploads/2014/02/Goi-buoi-tan-trieu.jpg', '1', 'LOAI001', 'TINH046'),
('DSAN100', 'Bưởi Tân Triều', 'Bưởi Tân Triều có vỏ màu xanh như bưởi da xanh, vỏ mỏng, ngọt thanh, không có vị hơi đắng và hậu ngọt. Những đặc sản từ trái bưởi mà bất cứ ai khi đến với Tân Triều cũng không thể bỏ qua đó chính là rượu bưởi, nem bưởi, chè bưởi và món gỏi bưởi.', b'1', 0, 'https://danviet.mediacdn.vn/upload/1-2017/images/2017-03-21/14900378621556-bduong_la_cam.jpg', '1', 'LOAI004', 'TINH046'),
('DSAN101', 'Gà nướng - xôi chiên phồng Đồng Nai', 'Nguyên liệu chính làm xôi chiên phồng là gạo nếp, đỗ xanh. Trước khi chế biến, gạo nếp và đậu xanh được ngâm nước và nấu chín. Gạo nếp nấu chín được trộn với đậu xanh để giúp cho bánh thêm bùi rồi sau đó cho vào giã nhuyễn như giã bánh dày để có thứ bột dẻo mịn.', b'0', 0, 'http://topplus.vn/Userfiles/Upload/images/d7491858e8ee4414bc19c07376cb253e.jpg', '1', 'LOAI001', 'TINH046'),
('DSAN102', 'Bánh bèo bì', 'Món ăn được sử dụng những nguyên liệu đơn giản từ bì và nắm mắm, rồi qua bàn tay chế biến của các đầu bếp tài ba đã tạo ra được hương vị món ăn thơm ngon, vô cùng hấp dẫn. Đảm bảo sau khi thưởng thức món bánh bèo bì, bạn sẽ phải nhớ mãi hương vị món ăn này cho mà xem.', b'0', 0, 'https://grf.vn/wp-content/uploads/2021/04/banh-beo-bi-binh-duong-mon-an-don-gian-nhung-vo-cung-ngon-undefined-48018033.jpg', '1', 'LOAI001', 'TINH047'),
('DSAN103', 'Bò nướng ngói', 'Nhắc đến đặc sản Bình Dương, ta không thể bỏ qua món bò nướng ngói. Thịt bò được nướng trên ngói nên chín đều, không bị cháy khét, khi chín giữ nguyên độ mềm ngọt tự nhiên.', b'0', 0, 'https://www.tourdulichbentre.com/images/bo-nuong-ngoi-binh-duong.jpg', '1', 'LOAI001', 'TINH047'),
('DSAN104', 'Mứt gừng Bình Nhâm', 'Mứt gừng Bình Nhâm được làm từ gừng “bánh tẻ” và đường. Miếng mứt gừng vàng tươi, cay nhẹ, ấm nồng và không quá ngọt trở thành món “ăn chơi” được nhiều người yêu thích. Nếu có dịp ghé Bình Nhâm, du khách đừng quên mua món đặc sản này về tặng người thân, bạn bè nhé!', b'1', 0, 'https://thucthan.com/media/2018/09/mut-gung/mut-gung.jpg', '1', 'LOAI003', 'TINH047'),
('DSAN105', 'Bún Hải Sản', 'Bún và hải sản là hai thành phần chính của món ăn này. Bạn nên múc bún và hải sản ra bát với tỉ lệ phù hợp, không quá ít hoặc quá nhiều. Bạn cũng nên rắc hành phi và ngò gai lên trên để tăng thêm mùi thơm và độ bắt mắt cho món ăn. Nước dùng nóng sẽ giúp bún và hải sản ngấm đều các gia vị và tạo cảm giác ấm áp khi ăn. Rau sống sẽ giúp tăng thêm chất xơ và thanh mát cho món ăn. Nước chấm và ớt tươi sẽ giúp tăng thêm vị chua, cay và thơm cho món ăn.', b'0', 0, 'https://langbun.vn/wp-content/uploads/2023/10/bun-hai-san-3.jpg', '1', 'LOAI001', 'TINH048'),
('DSAN106', 'Gỏi cá mai', 'Mỗi phần sẽ bao gồm: gỏi cá mai, nước chấm, rau sống và bánh tráng mỏng dùng để cuốn. Năm 2021 - 2022, Tổ chức Kỷ lục Việt Nam (VietKings) đã công bố gỏi cá mai là một trong những món ngon của Bà Rịa - Vũng Tàu nằm trong Top 100 món ăn đặc sản của 63 tỉnh, thành Việt Nam.', b'0', 0, 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/05_2022/goi-ca-mai-vung-tau.jpg', '1', 'LOAI001', 'TINH048'),
('DSAN107', 'Cơm lam Bình Phước', 'Cơm lam hay cơm ống sẽ dùng cơm nấu chín trong ống tre hay ống nứa, gạo có thể là gạo tẻ, gạo nếp trộn với nhiều loại đậu xanh, đậu phộng, đậu đen,... Phần ống tre cũng được lựa chọn cẩn thận, không được quá già hay quá non. Cơm lam khi nấu ra sẽ vừa dẻo vừa thơm, có cả hương vị đặc trưng của ống tre khiến ai cũng mê. Cơm lam dùng chung với thịt gà hay thịt heo rừng, rắc thêm muối vừng hoặc muối mè nữa là hết ý.', b'1', 0, 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/11_2022/com-lam-binh-phuoc-mot.jpg', '1', 'LOAI001', 'TINH049'),
('DSAN108', 'Nhãn da bò Thanh Lương', 'Nếu đến Bình Phước mà không thưởng thức qua món nhãn da bò Thanh Lương thì chắc chắn chuyến du lịch của bạn chưa được trọn vẹn. Với thiên nhiên trù phú, nhãn da bò ở đây không cần sử dụng thuốc trừ sâu hay phân bón. Trái nhãn to, cơm dày, hạt nhỏ ăn rất ngon ngọt. Đây là một trong những nông sản sạch có tiếng của tỉnh Bình Phước.', b'1', 0, 'https://bloganchoi.com/wp-content/uploads/2018/06/qua-nhan-cover.jpg', '1', 'LOAI004', 'TINH049'),
('DSAN109', 'Gỏi trái điều', 'Chắc hẳn du khách đã biết một trong những đặc sản Bình Phước chính là hạt điều. Chính vì thế mà người dân nơi đây đã tận dụng những trái điều thơm ngon để làm nên món gỏi trái điều cực kỳ hấp dẫn. Gỏi trái điều có vị chua chua lại ngọt ngọt kết hợp với một chút tôm và thịt, thêm một ít gia vị để tăng độ mặn. Đến Bình Phước thì nhớ phải thưởng thức qua gỏi trái điều đó!', b'0', 0, 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-binh-phuoc-1-1024x686.jpeg', '1', 'LOAI001', 'TINH049'),
('DSAN110', 'Đặc sản Bò tơ Tây Ninh', 'Khi ghé Tây Ninh bất cứ ai cũng muốn nếm thử qua món đặc sản hấp dẫn này. Ai đã từng ăn qua đều cảm nhận thịt bò ở đây có vị đặc trưng riêng, từng miếng thịt mềm mọng, ngon nức mũi. Những miếng thịt ở đây đã được các đầu bếp chuyên nghiệp chế biến, tẩm ướp gia vị kĩ càng khiến cho mọi người khó lòng mà từ chối.', b'0', 0, 'https://diachiamthuc.vn/wp-content/uploads/2023/04/Dac-san-Bo-to-Tay-Ninh.jpg', '1', 'LOAI001', 'TINH050'),
('DSAN111', 'Dưa lưới Happy Farm', 'Dưa lưới ở đây được trồng trong nhà kín bằng phương pháp chăm sóc hữu cơ, rất phù hợp với điều kiện thời tiết Tây Ninh nên dưa giòn, ngon và ngọt. Đây cũng là một địa điểm thú vụ để bạn khám phá khi đến Tây Ninh', b'1', 0, 'https://monkeymedia.vcdn.com.vn/upload/web/storage_web/26-06-2022_11:07:22_dinh-duong-dua-luoi.jpg', '1', 'LOAI004', 'TINH050'),
('DSAN112', 'Đặc sản Ốc xu núi Bà', 'Đối với những ai là tín đồ của ốc thì khi đến với Tây Ninh bạn sẽ không thể bỏ qua món ốc xu núi Bà được, món ốc ở đây được chế biến thành nhiều món ăn vô cùng hấp dẫn như xào, luộc, nướng,… Các đầu bếp ở đây chế biến những món ăn mê đắm lòng người, thịt ốc ở đây có vị rất tự nhiên, có vị dai, giòn đặc trưng. Đây là một trong những món ăn mà bạn không nên bỏ qua nhé.', b'0', 0, 'https://datviettour.com.vn/uploads/images/tin-tuc-SEO/mien-nam/tay-ninh/am-thuc/oc-xu-nui-ba.jpg', '1', 'LOAI001', 'TINH050'),
('DSAN113', 'Thịt lợn muối chua', 'Đây là một trong những món ăn nổi tiếng của mảnh đất Long An. Cách đơn giản nhất để thưởng thức món ăn này đó là cắt miếng thịt lợn muối chua thành từng lát nhỏ; sau đó mang đi trộn cùng với một chút thính và giềng. Ngoài ra, để tăng thêm hương vị cho món ăn thì thực khách còn ăn kèm với các loại rau sống khác nhau như: hung quế; rau thơm, chát xít,… Tuy nhiên, không phải ai cũng đủ can đảm để thưởng thức món thịt lợn muối chua độc đáo này.', b'0', 0, 'https://sakos.vn/wp-content/uploads/2023/05/dac-san-long-an-co-gi.jpg', '1', 'LOAI001', 'TINH051'),
('DSAN114', 'Canh chua cá chốt', 'Nhắc đến đặc sản Long An thì không thể bỏ qua món canh chua cá chốt ngon trứ danh. Đây là món ăn quen thuộc trong những bữa ăn hàng ngày của người dân Long An. Món ăn này có vị chua chua của nước dùng; vị ngọt thanh và béo ngậy của thịt cá nên rất kích thích vị giác khi ăn.', b'0', 0, 'https://www.vietfuntravel.com.vn/image/data/Mekong/dac-san-long-an-canh-chua-ca-chot-3.jpg', '1', 'LOAI001', 'TINH051'),
('DSAN115', 'Thanh long', 'Không nhắc đến thanh long Châu Thành. Thanh long Châu Thành là giống thanh long thơm ngon nổi tiếng của huyện Châu Thành, tỉnh Long An. Thanh long Châu Thành từ ngày xuất hiện cho đến nay đã góp phần làm cho kinh tế của nhiều bà con nông dân trở nên khá giả, hơn hết là đánh dấu thêm một loại trái cây đặc sản mới cho vùng đất Châu Thành, Long An.', b'1', 0, 'https://dongangia.com/files/news/trong-cay-thanh-long-trong-chau-ban-da-thu-chua-z7lg0zvr.jpg', '1', 'LOAI004', 'TINH051'),
('DSAN116', 'Nem Lai Vung Đồng Tháp', 'Trải qua nhiều thập kỷ, làng nghề nem Lai Vung ngày càng phát triển và ghi đậm dấu ấn về con người miền Tây và cả vùng Đồng Tháp. Chỉ vỏn vẹn những nguyên liệu đơn giản như bì và thịt heo cùng các gia vị như tỏi, tiêu, ớt, thính, lá vông… vậy mà món ăn dân dã này lại có mặt ở mọi buổi tiệc từ cưới hỏi đến những bữa cơm hằng ngày.', b'0', 0, 'https://dacsandongthapmuoi.vn/files/upload/san-pham/san-pham-xuat-xu-vung-dong-thap-muoi/nem-lai-vung-1-chuc-02.jpg', '1', 'LOAI001', 'TINH052'),
('DSAN117', 'Xoài Cao Lãnh', 'hêm một loại trái cây đặc sản nữa thể hiện được những ưu đãi của thiên nhiên dành cho Đồng Tháp là Xoài Cao Lãnh. Nhờ vào lớp đất sét trầm tích sông mà xoài được trồng ở vùng này có độ thơm ngon vượt trội.', b'0', 0, 'https://cdn.tgdd.vn/2020/10/CookProduct/1-1200x676-46.jpg', '1', 'LOAI004', 'TINH052'),
('DSAN118', 'Hủ tiếu Sa Đéc – hủ tiếu trứ danh miền Nam', 'Tô hủ tiếu nóng hổi ăn kèm với thịt, tim, gan… cùng các loại rau ăn kèm như giá, hẹ, cần tây và xà lách khiến người ăn khó mà cưỡng lại được. Thương hiệu hủ tiếu nổi tiếng đến nhiều nơi trên thế giới và được xuất khẩu từ những năm trước năm 1975 đến nay.', b'0', 0, 'https://mmvietnam.com/wp-content/uploads/2021/09/Hu-tieu-sadec.jpg', '1', 'LOAI001', 'TINH052'),
('DSAN119', 'Bún cá', 'Món bún là món ăn trứ danh của vùng đất An Giang. Món ăn này được bán ở nhiều nơi nhưng ngon nhất là ở Châu Đốc, Long Xuyên và Tân Châu. Người dân ở đây quen gọi bún cá là bún nước lèo. Mỗi nơi đều có vị bún cá đặc trưng, ở Long Xuyên vị bún nhạt và thơm mùi nghệ, ở Tân Châu và Châu Đốc bún cá có vị đậm đà hơn..', b'0', 0, 'https://cdn.vn.alongwalk.info/wp-content/uploads/2023/02/01181512/image-cac-quan-ban-bun-ca-ngon-o-an-giang-lam-say-long-thuc-khach-167522491117802.jpg', '1', 'LOAI001', 'TINH053'),
('DSAN120', 'Chè Thốt Nốt An Giang', 'Ngày nắng hanh hao mà được ăn một bát chè thốt nốt thanh mát thì quả là tuyệt vời quá rồi đúng không? Nhắc đến chè thì không biết phải kể đến bao giờ cho hết. Nhưng trong số đó không thể nào quên được món chè đặc trưng của vùng quê An Giang, chè thốt nốt. Bổ quả thốt nốt ra, bên trong là những múi trắng dẻo mềm vị thơm thơm khiến ai đã ăn một lần khó mà quên được. Đem chúng nấu với đậu xanh kèm nước cốt dừa ăn giải nhiệt quả là một món vô cùng hấp dẫn.', b'1', 0, 'https://yeubepviet.com/wp-content/uploads/2020/08/Ch%C3%A8-th%E1%BB%91t-n%E1%BB%91t-an-giang.jpg', '1', 'LOAI002', 'TINH053'),
('DSAN121', 'Lẩu mắm', 'Thành phố Châu Đốc được mệnh danh là vương quốc mắm vì hầu hết các chợ trong vùng đều có một khu dành riêng bán các loại mắm: mắm chốt, mắm sặt, mắm trèn, mắm thái… Mắm Châu Đốc nổi tiếng với mùi đặc trưng, có vị rất đặc biệt và được đánh giá cao về vệ sinh an toàn thực phẩm. Chính vì thế những món ăn làm từ mắm ở đây rất phong phú và lẩu mắm là một trong số đó. Những loại mắm dùng để nấu lẩu là mắm các sặc, cá chốt… Hai loại mắm này có vị ngọt và mùi hương rất kích thích.', b'0', 0, 'https://cdn.vietnammoi.vn/171464242508312576/2020/11/18/foody-hieu-mien-lau-mam-402-636553634603474244-1605693130291210997068.jpg', '1', 'LOAI001', 'TINH053'),
('DSAN122', 'Gỏi sò lông hoa chuối', 'Kiên Giang nổi tiếng với các món ăn từ sò, bên cạnh cháo sò, sò nướng mỡ hành, sò xào chua ngọt... bạn cũng không nên bỏ qua món gỏi sò lông trộn bắp chuối vô cùng hấp dẫn. Nguyên liệu chính của món ăn này gồm có sò, bắp chuối, sả, thịt ba chỉ luộc và gia vị. Sò sau khi sơ chế luộc chín sẽ trộn đều cùng với thịt thái mỏng, bắp chuối và nước mắm chanh tỏi, rau răm xắt nhỏ, hành tây cùng đậu phộng rang lên trên. Thưởng thức món gỏi sò lông lá chuối béo, ngọt và ngon mát.', b'0', 0, 'https://media.mia.vn/uploads/blog-du-lich/goi-so-long-hoa-chuoi-dac-san-kien-giang-van-nguoi-me-04-1666744377.jpeg', '1', 'LOAI001', 'TINH054'),
('DSAN123', 'Lẩu chua sả nghệ cá nhám giàu', 'Cá nhám là đặc sản nổi tiếng Hà Tiên, Kiên Giang có màu trắng rất bổ dưỡng và thịt dai ngon. Người dân Hà Tiên chế biến thành nhiều món ngon từ cá nhám, trong đó được yêu thích nhất là món nấu canh chua với sả nghệ. Thưởng thức món canh chua cá nhám kèm với bún tươi, rau muống và nước chấm chua cay. Sức hấp dẫn của món canh chua cá nhám đó là, sự kết hợp hài hòa giữa vị thơm của nghệ, sả và vị chua chua hấp dẫn nhắm rượu thì ngon miễn chê.', b'0', 0, 'https://media.mia.vn/uploads/blog-du-lich/lau-chua-sa-nghe-ca-nham-giau-tinh-hoa-am-thuc-tay-nam-bo-03-1666735729.jpeg', '1', 'LOAI001', 'TINH054'),
('DSAN124', 'Sầu riêng Ri 6', 'Nói đến sầu riêng phải nhắc đến sầu riêng Ri 6, một loại sầu riêng cực kỳ quen thuộc và dễ tìm ngoài chợ. Cái tên Ri 6 được đặt theo “cha đẻ” của giống cây này tại Việt Nam. Sầu riêng Ri 6 được ưa chuộng bởi mùi thơm đặc trưng, cơm dày, hạt lép, vị ngọt, béo vừa phải.', b'1', 0, 'https://cdn.tgdd.vn/Files/2019/03/14/1154630/diem-danh-cac-loai-sau-rieng-duoc-ua-chuong-nhat-1_700x400.jpg', '1', 'LOAI003', 'TINH054'),
('DSAN125', 'Cua Cà Mau', 'Nhắc đến vùng đất tận cùng của Tổ Quốc thì cua chính là món đặc sản Cà Mau hàng đầu phải kể đến. Không chỉ nổi tiếng trong nước, cua Cà Mau còn được xuất khẩu đi các nước lân cận. Thế nên, đặt chân đến Đất Mũi mà không thưởng thức món cua thì quả là một thiếu sót lớn.', b'0', 0, 'https://buffetposeidon.com/storage/app/media/Kham-pha-am-thuc/10.2022/251022-cua-ca-mau-buffet-poseidon-2.jpg', '1', 'LOAI001', 'TINH055'),
('DSAN126', 'Cá Thòi Lòi nướng', 'Một loại cá đặc trưng ở vùng ngập mặn, với vẻ ngoài tuy xấu xí, loài cá nhỏ bé này nổi bật khi vừa biết bơi, chạy trên mặt nước hay trên cạn và còn có thể leo cây. Và hơn hết, cá thòi lòi có nguồn dinh dưỡng cao, không có nhiều xương và không tanh.', b'0', 0, 'https://unisea.vn/media/news/3107_ca-thoi-loi-nuong-muoi-ot-01.JPG', '1', 'LOAI001', 'TINH055'),
('DSAN127', 'Nhãn', 'Nhãn đường phèn - đặc sản tiến Vua: Được trồng nhiều ở Hưng Yên và được xem là loại nhãn ngon nhất tại vùng này. Loại này khi chín có cơm vàng, hột đỏ, cơm mềm và giòn, trên mặt vỏ có những u nhỏ như đường phèn.', b'1', 0, 'https://vienthiacanh.vn/sites/default/files/anh_bai_viet/trai-nhan.JPG', '1', 'LOAI004', 'TINH055'),
('DSAN128', 'Lẩu mắm', 'Lẩu mắm là món ăn nổi tiếng của người miền Tây, và đến Bạc Liêu thì không thể bỏ qua đặc sản này. Món ăn là sự kết hợp giữa các dân tộc Chăm – Khmer – Hoa. Chính vì vậy, mà hương vị rất đặc trưng và vô cùng hấp dẫn. Lẩu có hương vị vừa ăn, nước thanh ngọt và sở hữu mùi mắm thơm đặc trưng, ăn kèm với hải sản tươi ngọt như cá basa, tôm, mực cùng các loại rau tươi ngon như rau muống, bông súng, bông điên điển,... là “chuẩn bài”.', b'0', 0, 'https://cdn.tgdd.vn/Files/2021/08/30/1379043/cach-nau-lau-mam-ca-linh-ngon-dung-chuan-vi-don-gian-tai-nha-202201060142070358.jpeg', '1', 'LOAI001', 'TINH056'),
('DSAN129', 'Bún nước lèo', 'Nếu thắc mắc đặc sản Bạc Liêu là gì thì bún nước lèo sẽ là món ăn không thể thiếu trong list ẩm thực phải thưởng thức khi đặt chân đến Bạc Liêu. Món ăn được chế biến đơn giản, với phần nước lèo được nấu từ mắm cá, mang hương thơm và vị thanh ngọt đặc trưng, đậm đà.', b'0', 0, 'https://cosopho.com/wp-content/uploads/2021/08/1.cong-thuc-nau-bun-nuoc-leo-lam-say-dam-long-thuc-khac.jpg', '1', 'LOAI001', 'TINH056'),
('DSAN130', 'Chè Bà Ba', 'Chè bà ba còn có tên gọi khác là chè thưng, đây là một trong những món chè nổi tiếng và khá quen thuộc với người dân vùng đất Nam Bộ. Bất cứ người dân Nam Bộ nào cũng ít nhất thử chè bà ba trong đời. Thưởng thức tô chè béo ngậy với sự kết hợp hài hòa giữa các loại nguyên liệu và được nêm nếm đậm đà mang đến cho người ăn cảm nhận khó quên ngay khi ăn miếng chè bà ba lần đầu tiên.', b'1', 0, 'https://fsfamily.vn/wp-content/uploads/2019/01/1-38.jpg', '1', 'LOAI002', 'TINH056'),
('DSAN131', 'Cá bống sao', 'Cá bống sao là món ăn đặc sản ở Cù Lao Dung. Cá có đốm xanh, da lấm tấm trắng li ti, tuy nhỏ nhưng ăn rất chắc thịt. Người dân địa phương thường dùng cá bống kho tiêu hoặc kho khô (theo tiếng địa phương là “kho chồn”).', b'0', 0, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/08/ca-bong-sao-thom-ngon.png', '1', 'LOAI001', 'TINH057'),
('DSAN132', 'Hủ tíu cà ri', 'Hủ tíu cà ri là niềm tự hào của người dân Vĩnh Châu, Sóc Trăng. Khác với hủ tíu Mỹ Tho hay hủ tíu Nam Vang lừng danh, hủ tíu nơi đây được biến tấu qua việc sử dụng thịt vịt xiêm thay cho thịt heo hay thịt gà.', b'0', 0, 'https://thegioiamthuc.com/wp-content/uploads/2018/08/hu-tieu-ca-ri-vinh-chau-soc-trang.jpg', '1', 'LOAI001', 'TINH057'),
('DSAN133', 'Bánh Pía', 'Bánh Pía Sóc Trăng có vị ngọt nhẹ của đậu xanh vị bùi của sầu riêng và đậm đà của trứng, lớp vỏ bánh mềm dẻo, mỏng manh nhưng đoàn kết ôm lấy nhân bánh thơm ngọt bên trong. Thưởng thức bánh pía cùng một tách trà nóng mới thấy hết được giá trị của loại bánh này, vị đăng đắng, thanh tao của trà làm bật dậy hương thơm, vị ngọt bùi lan ra trên đầu lưỡi', b'0', 0, 'https://canthomekongtour.com/static/media/Thao/8/banh-pia-soc-trang.png', '1', 'LOAI002', 'TINH057'),
('DSAN134', 'Bánh tráng Bến Tre', 'Bánh tráng phơi sương có vị chua, vị ngọt, dẻo, thơm nồng của gạo nếp mới nứt mẻ khi ăn, rất đặc biệt và lạ miệng. Nguyên liệu làm bánh tráng là gạo nếp, nguyên liệu làm bánh khá đặc trưng của miền Tây, cụ thể là từ xã Phú Tân, huyện Chợ Lách, tỉnh Bến Tre.', b'0', 0, 'https://hiepsi.vn/wp-content/uploads/2019/06/B%C3%A1nh-Tr%C3%A1ng-Ph%C6%A1i-S%C6%B0%C6%A1ng-C%E1%BB%95ng-L%C3%A0-%C4%90%E1%BB%8Fng-Ha-1.jpg', '1', 'LOAI002', 'TINH058'),
('DSAN135', 'Mắm cơm Bến Tre', 'Mắm cơm Bến Tre có vị chua, mặn, dậy mùi hương đặc trưng của biển, chế biến từ loài cá nhỏ có tên cơm đồng, mắm cơm rất dễ làm và thường được làm vào mùa cá.', b'0', 0, 'https://cdn.ivivu.com/2021/06/2-19.jpg', '1', 'LOAI001', 'TINH058'),
('DSAN136', 'Bún suông', 'Loại bún này khá nổi tiếng và được biết đến là đặc sản Trà Vinh nức tiếng. Những nguyên liệu trong món ăn đều được chọn lọc kỹ lưỡng và chế biến bởi những người đầu bếp lâu năm. Phần bánh của món ăn này được gọi là “suông” với sợi dày, bản to bằng khoảng nón tay út, khi nhai vào sẽ cảm thấy dai dai rất ngon.', b'0', 0, 'https://i.ytimg.com/vi/gVlSnIcpd6k/maxresdefault.jpg', '1', 'LOAI001', 'TINH059'),
('DSAN137', 'Trái quách', 'Quách được biết đến là loài cây khá kén đất và chỉ khu vực đồng bằng sông Cửu Long mới có thể trồng được. Loài cây này được người dân Trà Vinh trồng chủ yếu ở khu vực Cầu Kè và xen lẫn với cây ăn trái dùng để lấy trái và lấy bóng râm. Trái quách còn được coi là một trong những trái cây đặc sản của Trà Vinh. Trái quách có vị ngọt mát và mang lại công dụng thanh nhiệt cực tốt. Loại trái này mặc dù có vẻ ngoài không đẹp nhưng phần ruột bên trong lại rất ngọt mát và thu hút mọi du khách mỗi khi ghé thăm.', b'0', 0, 'https://khoinghieptre.tuoitrethudo.com.vn/stores/news_dataimages/khoinghieptretuoitrethudocomvn/082020/19/07/nhung-cong-dung-cua-trai-quach-khien-ban-bat-ngo-33-.4002.png', '1', 'LOAI002', 'TINH059'),
('DSAN138', 'Cháo ám', 'Cháo ám là món ăn có cái tên khá lạ và được nhiều người biết đến bởi tính phổ biến khi đến Trà Vinh. Vì vậy, nếu chưa biết đặc sản Trà Vinh là gì thì cháo ám sẽ là lựa chọn mà du khách nên thêm vào danh sách những món ngon, độc, lạ tại Trà Vinh.', b'0', 0, 'https://www.vietfuntravel.com.vn/image/data/Mekong/dac-san-tra-vinh-chao-am-1.png', '1', 'LOAI001', 'TINH059'),
('DSAN139', 'Bánh xèo hến Cù lao Dài', 'Bánh xèo là đặc sản của nhiều vùng, nhưng bánh xèo hến thì chỉ có ở Cù lao Dài (Vĩnh Long). Gọi là bánh xèo hến bởi nhân bánh được làm từ hến thay vì các nguyên liệu thường thấy như thịt heo, thịt bò. Nhân bánh có cả tôm nhưng vị hến vẫn là đặc trưng.', b'0', 0, 'https://image.cooky.vn/recipe/g6/50735/s/cooky-recipe-cover-r50735.jpg', '1', 'LOAI001', 'TINH060'),
('DSAN140', 'Cam Sành', 'Là một trong những quả vải ngon đứng đầu, không chỉ được người tiêu dùng trong nước ưa chuộng mà còn được xuất khẩu đến nhiều nơi trên thế giới.', b'1', 0, 'https://cdn.tgdd.vn/Files/2022/04/25/1428387/gioi-thieu-vai-thieu-nguon-goc-xuat-xu-mua-vai-thieu-khi-nao-202204251536015987.jpg', '1', 'LOAI004', 'TINH060'),
('DSAN141', 'Thịt chuột đồng', 'Không chỉ là vựa trái cây, Vĩnh Long còn là vựa lúa của Đồng bằng Sông Cửu Long. Mà ở đâu có nhiều lúa gạo, ở đó có chuột đồng. Chuột đồng hoàn toàn ăn lúa gạo nên thịt thơm và sạch, không giống như những loại chuột khác. Cứ đến mùa thu hoạch lúa, người ta lại săn chuột đồng về chế biến thành đủ các món ngon như chuột đồng nướng; chuột đồng xào sả ớt…', b'0', 0, 'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_680/v1596028661/blog/z8zrrl6hq22o4zpubdwn.jpg', '1', 'LOAI001', 'TINH060'),
('DSAN142', 'HỦ TIẾU MỸ THO', 'Cái dai mềm của sợi bánh, vị ngọt thanh của nước dùng, mềm ngọt của thịt hòa quyện vào vị chua chua vừa phải của nước chấm, không chỉ đem đến cảm giác ngon miệng cho người ăn mà còn đọng lại hương vị thơm ngon khó quên.', b'0', 0, 'https://znews-photo.zadn.vn/w660/Uploaded/ofh_huqfztmf/2019_09_01/1_banh_hu_tieu.jpg', '1', 'LOAI001', 'TINH061'),
('DSAN143', 'Trái bòn bon Bến Tre', 'Loại trái cây này có một hình dáng và vị ngon không thể cưỡng lại, chúng có màu sắc đặc trưng là màu vàng nâu, cắn vào phần vỏ ngoài bạn sẽ cảm nhận được hương vị thơm ngon, dai dai, chua chua, ngọt ngọt, lạ miệng.', b'0', 0, 'https://image.thanhnien.vn/768/uploaded/hoanganh/2018_07_18/2018_07_18_144913_trai_bo_nbon_ben_tre_QMYM.jpg', '1', 'LOAI002', 'TINH061'),
('DSAN144', 'Cá lóc đồng nướng trui', 'Cá lóc đồng có nhiều ở vùng sông nước Hậu Giang. Trước đây, cá lóc nướng trui là món ăn dân dã của nhà nghèo. Còn ngày nay, món ăn này đã trở thành đặc sản Hậu Giang có tên trong thực đơn của mọi nhà hàng. Món cá này ngon nhất khi được nướng nguyên con, không ướp và nướng bằng rơm. Khi ăn, cá được cuốn trong bánh tráng mỏng cùng bún; rau thơm; lá sen; khế chua…rồi chấm nước mắm tỏi ớt ngon quên sầu.', b'0', 0, 'https://daynauan.info.vn/wp-content/uploads/2018/04/ca-loc-nuong-trui.jpg', '1', 'LOAI001', 'TINH062'),
('DSAN145', 'Ốc len xào dừa', 'Ốc len xào dừa cũng là món được du khách yêu thích khi đến với Hậu Giang. Thịt ốc giòn giòn hòa quyện cùng nước cốt dừa béo ngậy và rau răm thơm lừng trong vòm miệng khiến thực khách ăn một lại muốn ăn hai. Phần nước sốt bạn có thể dùng để chấm bánh mì hoặc ăn cùng bún vô cùng lạ miệng.', b'0', 0, 'https://i.ytimg.com/vi/yk3eM_exu6U/maxresdefault.jpg', '1', 'LOAI001', 'TINH062'),
('DSAN146', 'Kẹo mè xửng', 'Một thứ kẹo ngon lại còn dai dai, ăn hoài vẫn không thấy ngán, kẹo Mè Xửng níu kéo cũng chính từ sự dẻo dai này. Nhẹ tay bóc ra lớp nilon mỏng là đã có trong tay miếng kẹo ngon lành, đưa lên miệng cắn một miếng nhỏ nhỏ thôi, đã làm môi lưỡi phải ngậm ngùi. Mùi mè rang thơm thật thơm, hòa lẫn trong kẹo là hương vị beo béo của đậu phộng.', b'1', 0, 'https://i.ytimg.com/vi/ahZvakiL2GA/maxresdefault.jpg', '1', 'LOAI003', 'TINH062'),
('DSAN147', 'Nem nướng Cái Răng', 'Nem nướng Cái Răng là một món ăn đặc sản Cần Thơ. Chính cách làm ra chiếc nem nướng đã khiến món ăn này trở thành đặc sản, khác với các loại nem nước khác: thịt lợn tươi được tẩm ướp gia vị rồi xay hoặc băm nhiễm, quệt dẻo rồi viên tròn lại, xiên vào que tre nhỏ và nướng trên than hồng; ăn kèm với bánh tráng, thêm bún, rau thơm, chuối chát, khế và dưa chua và chấm với nước mắm tỏi ớt.', b'0', 0, 'https://media.mia.vn/uploads/blog-du-lich/nem-nuong-cai-rang-huong-vi-dam-da-cua-can-tho-2-1649231593.jpg', '1', 'LOAI001', 'TINH063'),
('DSAN148', 'Đặc sản Cần Thơ - Bánh cống', 'Ốc len xào dừa cũng là món được du khách yêu thích khi đến với Hậu Giang. Thịt ốc giòn giòn hòa quyện cùng nước cốt dừa béo ngậy và rau răm thơm lừng trong vòm miệng khiến thực khách ăn một lại muốn ăn hai. Phần nước sốt bạn có thể dùng để chấm bánh mì hoặc ăn cùng bún vô cùng lạ miệng.', b'0', 0, 'https://tourcantho.vn/wp-content/uploads/banh-cong-can-tho-b.jpg', '1', 'LOAI001', 'TINH063'),
('DSAN149', 'Dâu Da', 'Trái dâu da là một loại trái cây nhỏ và ngon ngọt. Quả có màu xanh khi còn non và chuyển sang màu vàng, đỏ hoặc thậm chí tím đậm khi chín. Trái chín có thể được sử dụng tươi hoặc làm thành rượu vang.', b'1', 0, 'https://songkhoe.medplus.vn/wp-content/uploads/2019/11/L%E1%BB%A3i-%C3%ADch-c%E1%BB%A7a-5-1-1.png', '1', 'LOAI004', 'TINH063');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `DacSanLuu`
--

CREATE TABLE `DacSanLuu` (
  `IDDacSan` char(7) NOT NULL,
  `IDUsers` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Hinh_DacSan`
--

CREATE TABLE `Hinh_DacSan` (
  `IDHinh` char(7) NOT NULL,
  `LinkAnh` varchar(400) DEFAULT NULL,
  `IDDacSan` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `Hinh_DacSan`
--

INSERT INTO `Hinh_DacSan` (`IDHinh`, `LinkAnh`, `IDDacSan`) VALUES
('HI00001', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-hoa-binh-10.jpeg?tr=dpr-2,w-675', 'DSAN001'),
('HI00002', 'https://lh4.googleusercontent.com/k3sc7kC9AAf82jwk8OsBbyUzSuY_Cmhd8Cjk_mkDjkq2GY9nel1_zsFuAqSr9k9XCfJUTcnR2delptxQohV1Hi6LcWGO1ypKFVE4RczbTPM2N0uvqSHmKtyrsIM2ceY01y3O3O8bs2KqAq1f8MX9-7J4BYviUxEAxYBdrEMyKwjuxkGfC5ebnJl7RtMe4fIqMVPhycCcVw', 'DSAN001'),
('HI00003', 'https://www.mustgo.vn/files/uploads/1566495117-xoi-ngu-sac-tu-le.jpg', 'DSAN001'),
('HI00004', 'https://www.yong.vn/Content/images/foods/xoi-nep-mai-chau.jpg', 'DSAN001'),
('HI00005', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTywJuUtbkVuSnDBk4qLhTr5Gb9VC8FrBVq168ZIwqVpQ&s', 'DSAN002'),
('HI00006', 'https://vnanet.vn/Data/Articles/2020/12/31/5210300/vna_potal_cam_cao_phong_vao_mua_chin_ro_072221500_stand.jpg', 'DSAN002'),
('HI00007', 'https://lh5.googleusercontent.com/Inw970ZcHxEO8oa73fTZaG1d9Aw8JFSHd5PTDUxPebziWLHuKZ4nCDKiFgtWj6qPC5L-l74o40902BWPsyIA2nk0mYWy0rDzcfSWoalZ48dSMJ_U9PTpZNDJBgDhBP-2MM-uY6lefS61DNOMTpNu_dtv3BCyZ2zXGUjE85Yt0U8ZF72t1ZOwuLcFh1vCZNFofetVh7VEXg', 'DSAN002'),
('HI00008', 'https://lh5.googleusercontent.com/Inw970ZcHxEO8oa73fTZaG1d9Aw8JFSHd5PTDUxPebziWLHuKZ4nCDKiFgtWj6qPC5L-l74o40902BWPsyIA2nk0mYWy0rDzcfSWoalZ48dSMJ_U9PTpZNDJBgDhBP-2MM-uY6lefS61DNOMTpNu_dtv3BCyZ2zXGUjE85Yt0U8ZF72t1ZOwuLcFh1vCZNFofetVh7VEXg', 'DSAN002'),
('HI00009', 'https://www.kidsplaza.vn/blog/wp-content/uploads/2020/12/bai-2-dantri-186-finaldocx-1560668541913.png', 'DSAN003'),
('HI00010', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/416/540/products/co-duong-180ml-437b79a4-bcdf-4fcc-a42c-eaf6e0d1b6d3.jpg?v=1695619654250', 'DSAN003'),
('HI00011', 'https://channel.mediacdn.vn/2020/10/5/photo-1-1601894399663220539980.jpg', 'DSAN003'),
('HI00012', 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2021/10/23/966686/Moc-Chau-Milk-Anh-3.jpg', 'DSAN003'),
('HI00013', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-son-la-7-1024x768.jpeg?tr=dpr-2,w-675', 'DSAN004'),
('HI00014', 'https://s1.storage.5giay.vn/image/2016/08/20160805_def3e4776fb33b2049129305db94301d_1470375424.JPG', 'DSAN004'),
('HI00015', 'https://lh6.googleusercontent.com/proxy/hj60wWuwj1Afqpf8TblZp9vou5TH0COcIFcYEpyUkulogFCTQ8voU3n3VlsOsNxS0JGtqVrNJceE3FI10bYj_InJ90VR-1bgsQcQfKvjId_k8xetSX20tK7ZW4arbw', 'DSAN004'),
('HI00016', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/3/24/t9-16475165261612006867626-1648110155053-16481101551961704708516.jpg', 'DSAN004'),
('HI00017', 'https://benhphoitacnghen.vn/wp-content/uploads/2024/02/Thit-trau-gac-bep.jpg', 'DSAN005'),
('HI00018', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-dien-bien-1-1024x683.jpeg?tr=dpr-2,w-675', 'DSAN005'),
('HI00019', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaAJv7Yae68-6kJcaCarGdrIJ4YTF4kvT1mXtND5fU6g&s', 'DSAN005'),
('HI00020', 'https://cdn.alongwalk.info/vn/wp-content/uploads/2023/08/30170713/review-thit-trau-gac-bep-dac-san-noi-tieng-mien-nui-tay-bac1693364833.jpg', 'DSAN005'),
('HI00021', 'https://www.dienbien.gov.vn/portal/Photos/2022-03-23/9d68c7ad93e2114dS.jpg', 'DSAN006'),
('HI00022', 'https://dienbientv.vn/dataimages/201808/original/images2685788_wm_tuan_anh_che_tua_chua_12_1_InPixio.jpg', 'DSAN006'),
('HI00023', 'https://cdnmedia.baotintuc.vn/Upload/DmtgOUlHWBO5POIHzIwr1A/files/2022/04/19/che-san-tuyet-19042022a.jpg', 'DSAN006'),
('HI00024', 'https://dienbienfood.com/wp-content/uploads/2018/02/Untitled-1.jpg', 'DSAN006'),
('HI00025', 'https://cdn3.ivivu.com/2023/06/Xoi-Tim-lai-chau-ivivu.jpg', 'DSAN007'),
('HI00026', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/12_2022/xoi-tim-lai-chau-1.jpg', 'DSAN007'),
('HI00027', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/12_2022/xoi-tim-lai-chau-3.jpg', 'DSAN007'),
('HI00028', 'https://thegioiamthuc.com/wp-content/uploads/2017/10/xoi-tim1.jpg', 'DSAN007'),
('HI00029', 'https://cdn3.ivivu.com/2023/06/canh-ti%E1%BA%BFt-l%C3%A1-%C4%91%E1%BA%AFng-ivivu.jpg', 'DSAN008'),
('HI00030', 'https://poliva.vn/wp-content/uploads/2019/07/canh-tiet-la-dang-1.jpg', 'DSAN008'),
('HI00031', 'https://dulich.laichau.gov.vn/DataFiles/dulichlaichau/sanphamdulich/canh-tiet-la-dang/Canh-tiet-la-dang.jpg', 'DSAN008'),
('HI00032', 'https://gcs.tripi.vn/public-tripi/tripi-feed/img/473508hfi/image-cach-lam-mon-canh-tiet-la-dang-dac-san-cua-lai-chau-165293122314643.jpg', 'DSAN008'),
('HI00033', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-yen-bai-2-1024x597.jpg?tr=dpr-2,w-675', 'DSAN009'),
('HI00034', 'https://cdn.tgdd.vn/2021/12/CookRecipe/Avatar/ga-nuong-la-mac-mat-thumbnail.jpg', 'DSAN009'),
('HI00035', 'https://images.foody.vn/res/g79/789396/prof/s576x330/foody-upload-api-foody-mobile-thaophuongnguyen-161-181023184103.jpg', 'DSAN009'),
('HI00036', 'https://taybac.tv/wp-content/uploads/2023/06/12-Copy-640x400.webp', 'DSAN009'),
('HI00037', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-yen-bai-9-1024x683.jpeg?tr=dpr-2,w-675', 'DSAN010'),
('HI00038', 'https://behonexmart.com/upload/product/up-web-mohoa-nhan-3623.jpg', 'DSAN010'),
('HI00039', 'https://www.bometagroup.com/wp-content/uploads/2021/10/mat-ong-hoa-nhan.jpg', 'DSAN010'),
('HI00040', 'https://www.bometagroup.com/wp-content/uploads/2022/06/M%E1%BA%ACT-ONG-HOA-NH%C3%83N.jpg', 'DSAN010'),
('HI00041', 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-phu-tho-3-1024x500.jpg?tr=dpr-2,w-675', 'DSAN011'),
('HI00042', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/File/Image/lam_banh_tai_phu_tho_ngon.jpg', 'DSAN011'),
('HI00043', 'https://cdn.tgdd.vn/Files/2022/05/27/1435406/cach-lam-banh-tai-vac-bang-bot-mi-cuc-don-gian-ai-cung-lam-duoc-202205280130059776.jpg', 'DSAN011'),
('HI00044', 'https://nguoiphutho.com/wp-content/uploads/2021/08/banh-tai-phu-tho-1.jpg', 'DSAN011'),
('HI00045', 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-phu-tho-8.jpg?tr=dpr-2,w-675', 'DSAN012'),
('HI00046', 'https://cdn.tgdd.vn/Files/2023/11/08/1554413/buoi-doan-hung-dac-san-noi-tieng-vung-dat-to-202311081338563923.jpg', 'DSAN012'),
('HI00047', 'https://cafefcdn.com/203337114487263232/2020/11/19/photo-1-1605758836519462843535.jpg', 'DSAN012'),
('HI00048', 'https://buoidienbaominh.com/uploads/images/buoi-doan-hung-1.jpg', 'DSAN012'),
('HI00049', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-lao-cai-3.jpeg?tr=dpr-2,w-675', 'DSAN013'),
('HI00050', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuYEXh_8_3KoyzIEUB2cx3LfgZF1HfFXc7oBKQLJn-Q&s', 'DSAN013'),
('HI00051', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7wMDdwe23eFjPjbuAUUnCoYKDGg5iKcZF9-oU5GZRMw&s', 'DSAN013'),
('HI00052', 'https://ddk.1cdn.vn/2021/04/23/image.daidoanket.vn-images-upload-vanpt-04202021-_anh-1-5879.jpg', 'DSAN013'),
('HI00053', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-lao-cai-1-1-1024x683.jpeg?tr=dpr-2,w-675', 'DSAN014'),
('HI00054', 'https://mia.vn/media/uploads/blog-du-lich/top-10-quan-ca-hoi-sapa-dac-san-doc-dao-ma-ban-nhat-dinh-dung-bo-qua-01-1620835115.jpg', 'DSAN014'),
('HI00055', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxW60Jep7-V2wywZ2R6KSirYaQGYoB5c7NjfA1r9oDCg&s', 'DSAN014'),
('HI00056', 'https://haisanhonghiep.com/wp-content/uploads/2020/06/cahoi6-Copy.jpeg', 'DSAN014'),
('HI00057', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-tuyen-quang-2-1024x698.jpeg?tr=dpr-2,w-675', 'DSAN015'),
('HI00058', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/07_2019/banh-gai-chiem-hoa-4.jpg', 'DSAN015'),
('HI00059', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/07_2019/banh-gai-chiem-hoa-2.jpg', 'DSAN015'),
('HI00060', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/07_2019/banh-gai-chiem-hoa-1.jpg', 'DSAN015'),
('HI00061', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPIa5IaNnbWHtPfqdn_aSN85dN07-m2fvlWy2djl2WVA&s', 'DSAN016'),
('HI00062', 'https://baotuyenquang.com.vn/media/images/2023/02/img_20230222123003.jpg', 'DSAN016'),
('HI00063', 'https://ocopvietnam.langngheviet.com.vn/stores/news_dataimages/ocopvietnamcomvn/072022/20/13/ruou-ngo-na-hang-dac-san-mien-son-cuoc-05-.9944.jpg', 'DSAN016'),
('HI00064', 'https://i2.ex-cdn.com/nongnghiepso.nongnghiep.vn/files/guest/21/2021/12/21/21--165120-facebook-r-u-ng-men-l-na-hang-112636.jpg', 'DSAN016'),
('HI00065', 'https://mia.vn/media/uploads/blog-du-lich/thang-den-ha-giang-mon-an-choi-nuc-long-bao-thuc-khach-04-1642637283.jpg', 'DSAN017'),
('HI00066', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/10_2022/dac-san-thang-den-ha-giang-1_1.jpg', 'DSAN017'),
('HI00067', 'https://imgs.vietnamnet.vn/Images/2016/10/24/10/20161024100319-1.jpg', 'DSAN017'),
('HI00068', 'https://imgs.vietnamnet.vn/Images/2016/10/24/10/20161024100319-3.jpg', 'DSAN017'),
('HI00069', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-thanh-hoa-6.jpg?tr=dpr-2,w-675', 'DSAN018'),
('HI00070', 'https://thodiahagiang.com/wp-content/uploads/2018/02/pho-chua-ha-giang.jpg', 'DSAN018'),
('HI00071', 'https://motortrip.vn/wp-content/uploads/2023/02/pho-chua-ha-giang.jpg', 'DSAN018'),
('HI00072', 'https://hoangviettravel.vn/wp-content/uploads/2020/11/pho-chua-ha-giang3.jpg', 'DSAN018'),
('HI00073', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-bac-kan-1-1024x932.jpeg?tr=dpr-2,w-675', 'DSAN019'),
('HI00074', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEh-fvLRPfZ9jUvwqW56ly4IQhYsjK5R0TXeh-fI5NBA&s', 'DSAN019'),
('HI00075', 'https://www.kynghidongduong.vn/userfiles/images/Vietnam/Cao%20bang%20bac%20kan/dac%20san/tom-chua-bac-kan-viet-nam-kynghidongduong.vn%20(01).jpg', 'DSAN019'),
('HI00076', 'https://www.kynghidongduong.vn/images/destination/img1/1_tom-chua-bac-kan-viet-nam-kynghidongduong-vn.jpg', 'DSAN019'),
('HI00077', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-bac-kan-6-1024x683.jpeg?tr=dpr-2,w-675', 'DSAN020'),
('HI00078', 'https://cdn3.ivivu.com/2023/08/banh-cooc-mo-ivivu-1.jpg', 'DSAN020'),
('HI00079', 'https://thainguyen.gov.vn/documents/20181/179461/cooc-mo-banh-cua-thieu-nhi-2.jpg/56b8c77e-250f-4a11-9e70-f95e2bc55c14?t=1509702243894', 'DSAN020'),
('HI00080', 'https://cdn3.ivivu.com/2023/08/banh-cooc-mo-ivivu-3.jpg', 'DSAN020'),
('HI00081', 'https://www.sieuthianhduong.com/images/product/theme_1595925863_theme_gallery_z1996264580951_1af7544f07404598ee64778d5c023415.jpg', 'DSAN021'),
('HI00082', 'https://dulichviet.com.vn/images/bandidau/ngo-ngang-truoc-ve-dep-tuoi-xanh-cua-doi-che-tan-cuong.jpg', 'DSAN021'),
('HI00083', 'https://trathainguyen.net.vn/files/assets/tr_thi_nguyen_1.jpg', 'DSAN021'),
('HI00084', 'https://khoahocphattrien.vn/Images/Uploaded/Share/2017/05/01/che-bup-tan-cuong.jpg', 'DSAN021'),
('HI00085', 'https://cms.thainguyen.vn/documents/130266/13804972/Com+lam2.png/92b14173-4b44-4b8d-a36c-6dab1d72f61c?t=1700387760736', 'DSAN022'),
('HI00086', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC3UgacycMZaCHjkXb-Hga0BW95cqdNjX6grXq1TBfNw&s', 'DSAN022'),
('HI00087', 'https://tripzone.vn/uploads/202106/25/25/155758-internet---c-m-lam---c-s-n---nh-h-a-th-i-nguy-n.jpg', 'DSAN022'),
('HI00088', 'https://www.yong.vn/Content/images/foods/com-lam-dinh-hoa-thai-nguyen.jpg', 'DSAN022'),
('HI00089', 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-cao-bang-4.jpg?tr=dpr-2,w-675', 'DSAN023'),
('HI00090', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmuRSkFTnfcv01dbzycDRsvvVgQc5aJDK-KWhWB0Cl4Q&s', 'DSAN023'),
('HI00091', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT-ytRtRWBbpLYi6HT_o0QFRCuwKbU4PMZ5Ls1Lxwq5A&s', 'DSAN023'),
('HI00092', 'https://bizweb.dktcdn.net/100/232/452/products/dac-san-cao-bang-e1df629d-cb49-4aa7-8014-bdccbea840ba.jpg?v=1644412054467', 'DSAN023'),
('HI00093', 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-cao-bang-6.jpg?tr=dpr-2,w-675', 'DSAN024'),
('HI00094', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDBxf6pVZNrvAY7KBCqEnJgTCU-4hvHG527AXS3IDLVQ&s', 'DSAN024'),
('HI00095', 'https://cdn.tgdd.vn/Files/2021/06/02/1356872/cach-lam-banh-trung-kien-dac-san-cao-bang-thom-lung-beo-ngay-202109271616305292.jpg', 'DSAN024'),
('HI00096', 'https://media-cdn-v2.laodong.vn/storage/newsportal/2023/8/9/1226746/3-60-01.jpg', 'DSAN024'),
('HI00097', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-lang-son-4.jpg?tr=dpr-2,w-675', 'DSAN025'),
('HI00098', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvmS-4OdLk3Bgwhk7TYCfbZDyvtOaWoSxXh-m7Gb3Eg&s', 'DSAN025'),
('HI00099', 'https://4.bp.blogspot.com/-jKpKucmXQoo/WE5NJb5Ml0I/AAAAAAAAFzg/a0f24gouk4QhKaIwuPkXil8b6ntnx-vZQCLcB/s1600/Mon-ngon-Xu-Lang_15.jpg', 'DSAN025'),
('HI00100', 'https://travel-museum.s3.ap-southeast-1.amazonaws.com/44139ce9-0a8b-4ecb-b70c-484551a19796-nem-nuong-huu-lung-dac-san-lang-sonjpg.jpg', 'DSAN025'),
('HI00101', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-lang-son-7.jpg?tr=dpr-2,w-675', 'DSAN026'),
('HI00102', 'https://daylambanh.edu.vn/wp-content/uploads/2019/03/banh-ngai-thom-ngon-600x400.jpg', 'DSAN026'),
('HI00103', 'https://cdn.tgdd.vn/Files/2020/04/04/1246639/cach-lam-banh-ngai-cuu-thom-ngon-bo-duong-don-gia-1.jpg', 'DSAN026'),
('HI00104', 'https://tutafoods.com/wp-content/uploads/2021/12/ngai.jpeg', 'DSAN026'),
('HI00105', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-bac-giang-1.jpg?tr=dpr-2,w-675', 'DSAN027'),
('HI00106', 'https://file1.dangcongsan.vn/data/0/images/2023/06/15/upload_2674/5-doi-vai-luc-ngan.jpg', 'DSAN027'),
('HI00107', 'https://vaisomphuchoa.com/wp-content/uploads/2023/01/anh-vai-thieu-luc-ngan-min.jpg', 'DSAN027'),
('HI00108', 'https://vtv1.mediacdn.vn/thumb_w/640/2021/6/12/vai-thieu-bac-giang-1-16234666395321865179195.jpg', 'DSAN027'),
('HI00109', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5y06_oh3OCPtT1QNxGSS8jtB6bYUoKbeqF697IvdiJw&s', 'DSAN028'),
('HI00110', 'https://bavuiuytin.com/images/upload/images/19-B%C3%A1nh-%C4%91a-Th%E1%BB%95-H%C3%A0.jpg', 'DSAN028'),
('HI00111', 'https://tonkinvn.com/resources/images/Bai-viet-phu/banh-da-tho-ha.jpg', 'DSAN028'),
('HI00112', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS_WAhtUj_g7VUEklc4zPDhdTB2jWJDs7N7jv551F2hw&s', 'DSAN028'),
('HI00113', 'https://imagev3.vietnamplus.vn/w1000/Uploaded/2024/qfsqy/2023_12_15/pho-bat-dan-pho-gia-truyen-100-nam-tuoi-4098.jpg.webp', 'DSAN029'),
('HI00114', 'https://mia.vn/media/uploads/blog-du-lich/top-19-quan-pho-ha-noi-ngon-nuc-tieng-an-la-ghien-phan-1--1639124992.jpg', 'DSAN029'),
('HI00115', 'https://static.vinwonders.com/production/pho-bo-ha-noi.jpeg', 'DSAN029'),
('HI00117', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvizhE81Mzgsx7cK3lYDkYdwmtJ6nd83qQoocIO7hsBQ&s', 'DSAN030'),
('HI00118', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoIAYvjBaQWiB2PJh1bMNnloDRGvPwWkUmB91-ueXFiA&s', 'DSAN030'),
('HI00119', 'https://www.huongnghiepaau.com/wp-content/uploads/2016/04/mon-bun-thang.jpg', 'DSAN030'),
('HI00120', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYVfvqtHAPNBttupsG0LXqMJXCgd4GcKMgewYDbp2iAg&s', 'DSAN031'),
('HI00121', 'https://static.vinwonders.com/production/mien-tron-ha-noi-9.jpeg', 'DSAN031'),
('HI00122', 'https://static.vinwonders.com/production/mien-tron-ha-noi-7.jpg', 'DSAN031'),
('HI00123', 'https://bunchasinhtu.vn/wp-content/uploads/2021/05/z2056654741100_db72fc2e3119b7dab16c897596a3fd66.jpg', 'DSAN032'),
('HI00124', 'https://images.foody.vn/res/g7/67733/s400x400/foody-bun-cha-sinh-tu-nguyen-khuyen-257-636376137459310820.jpg', 'DSAN032'),
('HI00125', 'https://cdn.tgdd.vn/2022/01/CookRecipe/Avatar/bun-cha-ha-noi-cong-thuc-chia-se-tu-nguoi-dung-thumbnail.jpg', 'DSAN032'),
('HI00126', 'https://sakos.vn/wp-content/uploads/2023/10/bun-dau-mam-tom.jpg', 'DSAN033'),
('HI00127', 'https://trumfood.vn/wp-content/uploads/2022/09/bdmt.jpg', 'DSAN033'),
('HI00128', 'https://photo.znews.vn/w660/Uploaded/zngure/2019_09_10/2_doiratngon.jpg', 'DSAN033'),
('HI00129', 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-vinh-phuc-2-1024x639.jpg?tr=dpr-2,w-675', 'DSAN034'),
('HI00130', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE4pyO9a4zNuOQGeraOhGyJ6mw6w4tqv0NoOZIS-LeHA&s', 'DSAN034'),
('HI00131', 'https://image.bnews.vn/MediaUpload/Org/2018/02/12/223054_screen-shot-2018-02-12-at-22-29-50.png', 'DSAN034'),
('HI00132', 'https://afamilycdn.com/150157425591193600/2022/8/8/ca-thinh-lap-thach-14-anh-truong-foods-16599140066371672205001.jpg', 'DSAN034'),
('HI00133', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGafHz46bop5hKTsV-6O7CjuBDjyv9FFmM1MDZYenFVA&s', 'DSAN035'),
('HI00134', 'https://ik.imagekit.io/tvlk/blog/2022/03/dac-san-vinh-phuc-3.jpg?tr=dpr-2,w-675', 'DSAN035'),
('HI00135', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr5UKCtKWofBxqFxkSQS3btpnZ-OBek0Hi0i6M7LnICw&s', 'DSAN035'),
('HI00136', 'https://tapchidiaoc.com/wp-content/uploads/2018/02/2-96.jpg', 'DSAN035'),
('HI00137', 'https://cdn3.ivivu.com/2022/12/banh-phu-the-dinh-bang-ivivu-13.jpg', 'DSAN036'),
('HI00138', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-bac-ninh-2.jpg?tr=dpr-2,w-675', 'DSAN036'),
('HI00139', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh5SSRIMIBQc-8eqzHHTX8m4isdSKeSipYIcf2hYEuLw&s', 'DSAN036'),
('HI00140', 'https://shopnongsansach.com/wp-content/uploads/banh-phu-the-dinh-bang-bac-ninh.jpg', 'DSAN036'),
('HI00141', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-bac-ninh-1.jpg?tr=dpr-2,w-675', 'DSAN037'),
('HI00142', 'https://nhn.1cdn.vn/2023/11/04/banh-khuc.jpg', 'DSAN037'),
('HI00143', 'https://cdn-i.vtcnews.vn/resize-v1/jcXGoDGVJgmJeTrdElu02xA81Om9YysZR92bBhdySDI/upload/2022/05/16/z3417955708507157668c0c06500b2d53a83cb1bb3bec8-11332469.jpg', 'DSAN037'),
('HI00144', 'https://cdn3.ivivu.com/2022/12/banh-khuc-lang-diem-ivivu-2.jpg', 'DSAN037'),
('HI00145', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hai-duong-2.jpg?tr=dpr-2,w-675', 'DSAN038'),
('HI00146', 'https://cdn.tgdd.vn/Files/2023/12/19/1557886/cach-an-banh-dau-xanh-doc-la-khong-phai-ai-cung-biet-202312191054387993.jpg', 'DSAN038'),
('HI00147', 'https://lamsonfood.com/wp-content/uploads/2023/07/Banh-dau-xanh-4.jpg', 'DSAN038'),
('HI00148', 'https://giadinh.mediacdn.vn/296230595582509056/2023/12/18/cach-lam-banh-dau-xanh-1702818964027463295006-1702867873464-17028678736622088925997.jpg', 'DSAN038'),
('HI00149', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hai-duong-4.jpeg?tr=dpr-2,w-675', 'DSAN039'),
('HI00150', 'https://bhd.1cdn.vn/2018/02/19/files-library-images-banh%20long.jpg', 'DSAN039'),
('HI00151', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFKxreb83nBornjmxFQOfAFgx-0VcTpKCqmq9i1LCXzg&s', 'DSAN039'),
('HI00152', 'https://thegioiamthuc.com/wp-content/uploads/2017/10/banh-long.jpg', 'DSAN039'),
('HI00153', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hung-yen-3.jpg?tr=dpr-2,w-675', 'DSAN040'),
('HI00154', 'https://cdn3.ivivu.com/2022/12/cha-ga-tieu-quan-ivivu-1.jpg', 'DSAN040'),
('HI00155', 'https://cdn3.ivivu.com/2022/12/cha-ga-tieu-quan-ivivu-2.jpg', 'DSAN040'),
('HI00156', 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2020/11/24/856971/1460396708Cha-Ga-Tie.jpg', 'DSAN040'),
('HI00157', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hung-yen-4.jpg?tr=dpr-2,w-675', 'DSAN041'),
('HI00158', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV6v7XytYQzbJ7M7vtyjLvZ3tH_4imoh6tBd_UEQ3uAw&s', 'DSAN041'),
('HI00159', 'https://cdn.tgdd.vn/2021/02/CookProduct/THUM-OFF-1200x676.jpg', 'DSAN041'),
('HI00160', 'https://www.huongnghiepaau.com/wp-content/uploads/2019/01/tuong-ban-600x401.jpg', 'DSAN041'),
('HI00161', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hung-yen-6.jpg?tr=dpr-2,w-675', 'DSAN042'),
('HI00162', 'https://thegioiamthuc.com/wp-content/uploads/2017/10/dac-san-hung-yen-ruou-lac-dao-600x339.jpg', 'DSAN042'),
('HI00163', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaBdecm_uhipXW35RnASHfWHf9sJS60iIFcH8KtDi4bQ&s', 'DSAN042'),
('HI00164', 'https://ruoubatrang.com/wp-content/uploads/2022/02/Nghe-nau-ruou-truyen-thong-Lac-Dao-Hung-Yen-1-e1646398312225.jpg', 'DSAN042'),
('HI00165', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-thai-binh-1-1024x1024.jpg?tr=dpr-2,w-675', 'DSAN043'),
('HI00166', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0TkrQC7KlzLjGKkt6VteW3ewvHSCbQEHyDa8sym-IGw&s', 'DSAN043'),
('HI00167', 'https://cdn.alongwalk.info/vn/wp-content/uploads/2022/05/13202416/image-banh-gio-ben-hiep-dac-san-thon-que-thai-binh-165242305698439.jpg', 'DSAN043'),
('HI00168', 'https://media.baothaibinh.com.vn/upload/news/8_2010/619_banhgio.jpg', 'DSAN043'),
('HI00169', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-hung-yen-5-1024x683.jpg?tr=dpr-2,w-675', 'DSAN044'),
('HI00170', 'https://photo-cms-baophapluat.epicdn.me/w840/Uploaded/2024/zsgkqzztgymu/2017_03_11/500390monngonhungyenechomphuongtuong2ab3_NMKJ.jpg', 'DSAN044'),
('HI00171', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK9L00mEGYPXdPUbFEPtlFPvW4N1kZ-Oc3_S10xMuPSw&s', 'DSAN044'),
('HI00172', 'https://static.tuoitre.vn/tto/i/s626/2010/01/24/wfbFDhGD.jpg', 'DSAN044'),
('HI00173', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-ha-nam-1-1024x1002.jpeg?tr=dpr-2,w-675', 'DSAN045'),
('HI00174', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRgjIuo7-E8fvsqm__vkLem5_GyxO3m84H64fJ0RxeHg&s', 'DSAN045'),
('HI00175', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn511xhXVWrTVdqstuUtVS0EHxrCyElW4AQNDJ5QeiXQ&s', 'DSAN045'),
('HI00176', 'https://cdn.tgdd.vn/Files/2021/01/20/1321543/ca-kho-lang-vu-dai-khong-he-kho-lam-day-la-cach-kho-ca-kieu-vu-dai-ngay-tai-nha-202101201952000541.jpg', 'DSAN045'),
('HI00177', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-ha-nam-5-1024x614.png?tr=dpr-2,w-675', 'DSAN046'),
('HI00178', 'https://hanam.gov.vn/PublishingImages/Pages/08-13-2018/banh-cuon-cha-phu-ly.jpg', 'DSAN046'),
('HI00179', 'https://cafefcdn.com/203337114487263232/2022/9/9/photo-7-16627284156861720376491.jpg', 'DSAN046'),
('HI00180', 'https://images.foody.vn/res/g95/942444/prof/s1242x600/foody-upload-api-foody-mobile-5-200925150807.jpg', 'DSAN046'),
('HI00181', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-ninh-binh-2.jpg?tr=dpr-2,w-675', 'DSAN047'),
('HI00182', 'https://mia.vn/media/uploads/blog-du-lich/com-chay-ninh-binh-dac-san-tru-danh-voi-cong-thuc-che-bien-truyen-thong-01-1640705441.jpg', 'DSAN047'),
('HI00183', 'https://mia.vn/media/uploads/blog-du-lich/top-7-thuong-hieu-com-chay-ninh-binh-ngon-chuan-cua-chinh--1640701272.jpg', 'DSAN047'),
('HI00184', 'https://tourdanangcity.vn/wp-content/uploads/2023/05/com-chay-ninh-binh-c.jpg', 'DSAN047'),
('HI00185', 'https://mia.vn/media/uploads/blog-du-lich/diem-mat-goi-ten-nhung-quan-de-ngon-ninh-binh-nuc-tieng-1640528978.jpg', 'DSAN048'),
('HI00186', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-ninh-binh-3.jpeg?tr=dpr-2,w-675', 'DSAN048'),
('HI00187', 'https://vcdn-dulich.vnecdn.net/2014/11/08/de-luoc-cham-tuong-3154-1415423745.jpg', 'DSAN048'),
('HI00188', 'https://denui35aninhbinh.com/upload/elfinder/D%C3%AA%20n%C6%B0%E1%BB%9Bng%20%28m%E1%BB%8Di%2C%20l%E1%BB%A5i%2C%20chao%2C%20mu%E1%BB%91i%20%E1%BB%9Bt%29%283%29.jpg', 'DSAN048'),
('HI00189', 'https://cdn-i.vtcnews.vn/resize/th/upload/2023/02/24/dac-san-nam-dinh-xiu-pao-13483325.jpg', 'DSAN049'),
('HI00190', 'https://cdn.tgdd.vn/2020/10/CookProduct/1115-1200x676-2.jpg', 'DSAN049'),
('HI00191', 'https://cdn.tgdd.vn/Files/2021/07/24/1370531/cach-lam-banh-xiu-pao-dac-san-nam-dinh-mem-ngon-hap-dan-202201061132154649.jpg', 'DSAN049'),
('HI00192', 'https://cafefcdn.com/203337114487263232/2022/8/30/photo-1-16618498406131690204041.jpg', 'DSAN049'),
('HI00201', 'https://ik.imagekit.io/tvlk/blog/2022/08/dac-san-hai-phong-4.jpg?tr=dpr-2,w-675', 'DSAN052'),
('HI00202', 'https://cdn.tgdd.vn/2022/01/CookDish/cach-lam-bun-nem-cua-be-thom-gion-vang-uom-kho-cuong-cuc-don-avt-1200x676.jpg', 'DSAN052'),
('HI00203', 'https://netspace.edu.vn/app_assets/images/2020/03/26/cach-lam-nem-cua-be-thom-ngon-gion-rum-244958-800.jpg', 'DSAN052'),
('HI00204', 'https://cdn.tgdd.vn/Files/2021/07/31/1372059/cach-lam-nem-cua-be-gion-xop-beo-ngay-202206071355574822.jpg', 'DSAN052'),
('HI00205', 'https://static.vinwonders.com/production/cha-muc-ha-long-04.jpg', 'DSAN053'),
('HI00206', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-quang-ninh-1-1024x692.jpeg?tr=dpr-2,w-675', 'DSAN053'),
('HI00207', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV_tibdcJX8FJpenv9xY9VmQgQIhuXfzryQNfj8ekbDQ&s', 'DSAN053'),
('HI00208', 'https://chaca.com.vn/wp-content/uploads/2023/08/cha-muc-quang-ninh.jpg', 'DSAN053'),
('HI00209', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-quang-ninh-2.jpeg?tr=dpr-2,w-675', 'DSAN054'),
('HI00210', 'https://static.vinwonders.com/production/ga-doi-tien-yen-2.jpg', 'DSAN054'),
('HI00211', 'https://vnn-imgs-f.vgcloud.vn/2019/07/10/08/ga-doi-tien-yen-2.jpg', 'DSAN054'),
('HI00212', 'https://www.wyndhamhalong.com/uploads/blog/2017/Thang_1/ga-doi-tien-yen.jpg', 'DSAN054'),
('HI00213', 'https://statics.vinpearl.com/banh-cuon-thanh-hoa-9_1629691632_1679923089.jpg', 'DSAN055'),
('HI00214', 'https://media.cungphuot.info/2018/06/25177/banh-cuon-thanh-hoa.jpg', 'DSAN055'),
('HI00215', 'https://1.bp.blogspot.com/-Pj8cAWMMzOU/T-HPvuN7NQI/AAAAAAAAAe0/MY7cLeWu3n8/s1600/Banh+cuon+cha.jpg', 'DSAN055'),
('HI00216', 'https://anuongthanhhoa.vn/wp-content/uploads/2021/09/banh-cuon-ngon-thanh-hoa-2.jpg', 'DSAN055'),
('HI00217', 'https://www.yong.vn/Content/images/foods/buoi-tien-vua-thanh-hoa.jpg', 'DSAN056'),
('HI00218', 'https://static2-images.vnncdn.net/files/publish/2022/11/24/buoi-tien-vua-310.jpg', 'DSAN056'),
('HI00219', 'https://images.kienthuc.net.vn/zoomh/800/uploaded/nguyenvan/2019_01_05/6/nhung-vuon-buoi-do-tien-vua-hai-ra-tien-dip-tet-nguyen-dan-Hinh-10.jpg', 'DSAN056'),
('HI00220', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/1/2/b5-16407916056581308075109-1641087180284-1641087180600878367837-1641111825514-164111182577896313625.jpg', 'DSAN056'),
('HI00221', 'https://tse4.mm.bing.net/th?id=OIP.fBWg2YKZR2A3vUTqHlk10AHaHa&pid=Api&P=0&h=180', 'DSAN057'),
('HI00222', 'https://dacsanthanhtam.com/wp-content/uploads/2019/08/san-pham-banh-gai-tu-tru.jpg', 'DSAN057'),
('HI00223', 'https://statics.vinpearl.com/banh-gai-tu-tru-4_1633945907.png', 'DSAN057'),
('HI00224', 'https://statics.vinpearl.com/banh-gai-tu-tru-2_1633945852.png', 'DSAN057'),
('HI00225', 'https://statics.vinpearl.com/chao-luon-nghe-an-3-1_1630404586.png', 'DSAN058'),
('HI00226', 'https://statics.vinpearl.com/chao-luon-nghe-an-01_1630408554.jpg', 'DSAN058'),
('HI00227', 'https://statics.vinpearl.com/chao-luon-nghe-an-2_1630404516.png', 'DSAN058'),
('HI00228', 'https://phongnhaexplorer.com/wp-content/uploads/2021/08/chao-luon-xu-nghe-g.jpg', 'DSAN058'),
('HI00229', 'https://hanhtrinhdulich.vn/wp-content/uploads/2021/10/banh-gai-xu-Dua-Nghe-An-e1635059487663.webp', 'DSAN059'),
('HI00230', 'https://vietyouth.vn/wp-content/uploads/2020/08/banh-gai-xu-dua-1.jpeg', 'DSAN059'),
('HI00231', 'https://tse3.mm.bing.net/th?id=OIP.XLU8qDF79fvLUHcwqpuqbwHaFv&pid=Api&P=0&h=180', 'DSAN059'),
('HI00232', 'https://cdn.tgdd.vn/Files/2021/06/25/1363248/huong-dan-lam-banh-gai-deo-thom-ngon-chuan-vi-202110281349012316.jpg', 'DSAN059'),
('HI00233', 'https://phongnhaexplorer.com/wp-content/uploads/2021/09/lau-ca-khoai-quang-binh-k.jpg', 'DSAN062'),
('HI00234', 'https://statics.vinpearl.com/lau-ca-khoai-quang-binh-01_1632812019.jpg', 'DSAN062'),
('HI00235', 'https://statics.vinpearl.com/lau-ca-khoai-quang-binh-03_1632813587.jpg', 'DSAN062'),
('HI00236', 'https://statics.vinpearl.com/lau-ca-khoai-quang-binh-3_1632813498.jpg', 'DSAN062'),
('HI00237', 'https://i2.wp.com/kenhhomestay.com/wp-content/uploads/2018/12/dac-san-quang-tri-3.jpg', 'DSAN063'),
('HI00238', 'https://vitinfo.com.vn/wp-content/uploads/2018/05/banh-tet-mat-trang-1.jpg', 'DSAN063'),
('HI00239', 'https://misolhouse.com/assets/uploads/5a661ad6cfe4090fed93f0f9f3d8b3d4.jpg', 'DSAN063'),
('HI00240', 'https://helenrecipes.com/wp-content/uploads/2014/01/banh-tet-1024x682-1.jpg', 'DSAN063'),
('HI00241', 'https://pic.trangvangvietnam.com/395725168/100_4444.jpg', 'DSAN064'),
('HI00242', 'https://pic.trangvangvietnam.com/395725168/11111.jpg', 'DSAN064'),
('HI00243', 'https://pic.trangvangvietnam.com/395725168/100_4450.jpg', 'DSAN064'),
('HI00244', 'http://www.ruoukimlong.vn/upload/product/ruoukimlong14501-3788.jpg', 'DSAN064'),
('HI00245', 'https://d13jio720g7qcs.cloudfront.net/images/guides/origin/5f2141d158654.jpg', 'DSAN065'),
('HI00246', 'https://www.indochinavoyages.com/wp-content/uploads/2020/02/bun-bo-hue-1.jpg', 'DSAN065'),
('HI00247', 'https://vietnamtimes.org.vn/stores/news_dataimages/duongnganvnt/032021/30/19/5650_How-to-cook-bun-bo-hue.png?rt=20210331080527', 'DSAN065'),
('HI00248', 'https://tse2.mm.bing.net/th?id=OIP.KTaEv0FYG_-vJnOaU0qg4QHaHA&pid=Api&P=0&h=180', 'DSAN065'),
('HI00249', 'https://adventurejourney.vn/upload/image/che-hue.jpg', 'DSAN066'),
('HI00250', 'https://i.pinimg.com/736x/09/d8/8b/09d88b93f3fed6b367e0255d9721ab6b--hue.jpg', 'DSAN066'),
('HI00251', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/12_2019/cac-mon-che-ngon-o-hue-van-nguoi-me1.jpg', 'DSAN066'),
('HI00252', 'https://media.mia.vn/uploads/blog-du-lich/Thuong-thuc-nhung-mon-che-Hue-day-hap-dan-tai-che-Mo-Ton-Dich-08-1638913129.jpg', 'DSAN066'),
('HI00253', 'https://tse4.mm.bing.net/th?id=OIP.9KoH14iQZ_w-bKAbNPUcCAHaHa&pid=Api&P=0&h=180', 'DSAN067'),
('HI00254', 'https://statics.vinpearl.com/chao-canh-ha-tinh-8_1679645511.jpg', 'DSAN067'),
('HI00255', 'https://statics.vinpearl.com/chao-canh-ha-tinh-1_1632661589.png', 'DSAN067'),
('HI00256', 'https://toplist.vn/images/800px/chao-canh-dung-xuan-793748.jpg', 'DSAN067'),
('HI00257', 'https://tse3.mm.bing.net/th?id=OIP.IY2WGPeIP8wFsNW5KlJ8ZgHaHa&pid=Api&P=0&h=180', 'DSAN068'),
('HI00258', 'https://statics.vinpearl.com/banh-ngao-ha-tinh-1_1632665617.jpg', 'DSAN068'),
('HI00259', 'https://statics.vinpearl.com/banh-ngao-ha-tinh-8_1632666108.jpg', 'DSAN068'),
('HI00260', 'https://statics.vinpearl.com/banh-ngao-ha-tinh-2_1679645762.jpg', 'DSAN068'),
('HI00261', 'https://hapinut.com/wp-content/uploads/2022/03/mi-quang-quang-nam.jpg', 'DSAN069'),
('HI00262', 'https://pastaxi-manager.onepas.vn/content/uploads/articles/cach-nau-mi-Quang/cach-nau-my-quang-8.jpg', 'DSAN069'),
('HI00263', 'https://static.vinwonders.com/2022/11/mi-quang-quang-nam-2.jpg', 'DSAN069'),
('HI00264', 'https://nghebep.com/wp-content/uploads/2017/07/mi-quang-quang-nam.jpg', 'DSAN069'),
('HI00265', 'https://tse4.mm.bing.net/th?id=OIP.BrcXuzEkuxp4cQiTBMHK8wHaNM&pid=Api&P=0&h=180', 'DSAN070'),
('HI00266', 'https://quahueonline.com/wp-content/uploads/2020/07/%C4%90%E1%BA%B7c-s%E1%BA%A3n-Qu%E1%BA%A3ng-Nam-R%C6%B0%E1%BB%A3u-h%E1%BB%93ng-%C4%91%C3%A0o-chum-600ml-2.jpg', 'DSAN070'),
('HI00267', 'https://quahueonline.com/wp-content/uploads/2020/07/%C4%90%E1%BA%B7c-s%E1%BA%A3n-Qu%E1%BA%A3ng-Nam-R%C6%B0%E1%BB%A3u-h%E1%BB%93ng-%C4%91%C3%A0o-h%E1%BB%93-l%C3%B4-600ml-3.jpg', 'DSAN070'),
('HI00268', 'https://www.ruoulangvoc.com/images/2023/cac_loai_ruou_hong_dao_quang_nam.jpg', 'DSAN070'),
('HI00269', 'https://dacsanlamqua.com/wp-content/uploads/2021/05/banh-kho-me-ba-lieu-da-nang-mua-o-dau-tai-da-nang.jpg', 'DSAN071'),
('HI00270', 'https://uthadacsan.com/wp-content/uploads/2022/06/banh-kho-me-02.jpg', 'DSAN071'),
('HI00271', 'http://media.foody.vn/res/g10/91473/prof/s640x400/foody-mobile-6977_khome4ef0ajpg-j-635448356832154109.jpg', 'DSAN071'),
('HI00272', 'https://banhkhome.com/uploads/article/380x283dac-san-qua-tang-banh-kho-me-ba-lieu-me-da-nang-1671026105.png', 'DSAN071'),
('HI00273', 'https://img-global.cpcdn.com/recipes/da2ad5d76d683cf3/1200x630cq70/photo.jpg', 'DSAN072'),
('HI00274', 'https://hanamihotel.com/wp-content/uploads/2020/01/B%C3%BAn-ch%E1%BA%A3-c%C3%A1-%C4%90%C3%A0-N%E1%BA%B5ng-2.jpg', 'DSAN072'),
('HI00275', 'https://hanamihotel.com/wp-content/uploads/2020/01/B%C3%BAn-ch%E1%BA%A3-c%C3%A1-Th%E1%BB%A7y-%C4%90%C3%80-N%E1%BA%B5ng.jpg', 'DSAN072'),
('HI00276', 'https://cdn.tgdd.vn/2021/04/CookProduct/BeFunky-collage-2021-04-24T143344.078-1200x676.jpg', 'DSAN072'),
('HI00277', 'https://dacsanlamqua.com/wp-content/uploads/2021/05/banh-kho-me-ba-lieu-da-nang-mua-o-dau-tai-da-nang.jpg', 'DSAN073'),
('HI00278', 'https://uthadacsan.com/wp-content/uploads/2022/06/banh-kho-me-02.jpg', 'DSAN073'),
('HI00279', 'http://media.foody.vn/res/g10/91473/prof/s640x400/foody-mobile-6977_khome4ef0ajpg-j-635448356832154109.jpg', 'DSAN073'),
('HI00280', 'https://banhkhome.com/uploads/article/380x283dac-san-qua-tang-banh-kho-me-ba-lieu-me-da-nang-1671026105.png', 'DSAN073'),
('HI00281', 'https://travelservices-lesvos.com/wp-content/uploads/2019/04/banh-no-quang-ngai-576x420.jpg', 'DSAN074'),
('HI00282', 'https://dacsanchinhgoc.vn/upload/product/banh-no-quang-ngai.jpeg', 'DSAN074'),
('HI00283', 'https://filebroker-cdn.lazada.vn/kf/Sa718e5e4911c4505876d13e128f4dbe52.jpg', 'DSAN074'),
('HI00284', 'https://top5quangngai.com/wp-content/uploads/2022/07/banh-no-mon-qua-tham-duom-vi-thom-cua-huong-dong-co-noi-xu-quang.jpg', 'DSAN074'),
('HI00285', 'https://bazantravel.com/cdn/medias/uploads/29/29239-bun-cha-ca-670x446.jpg', 'DSAN075'),
('HI00286', 'https://yt.cdnxbvn.com/medias/uploads/204/204024-bun-cha-ca-quy-nhon.jpg', 'DSAN075'),
('HI00287', 'https://vietyouth.vn/wp-content/uploads/2020/08/bun-cha-ca-an-kem-voi-mon-rau-song-.jpeg', 'DSAN075'),
('HI00288', 'https://www.yong.vn/Content/images/foods/bun-cha-ca-quy-nhon-binh-dinh.jpg', 'DSAN075'),
('HI00289', 'https://tse4.mm.bing.net/th?id=OIP.RAlaYKRVxo3dWhejx8H0gQHaJD&pid=Api&P=0&h=180', 'DSAN076'),
('HI00290', 'https://spk.vn/wp-content/uploads/2021/04/banh-gai.jpg', 'DSAN076'),
('HI00291', 'https://salatour.com/wp-content/uploads/2020/08/cach-lam-banh-it-la-gai-binh-dinh.jpg', 'DSAN076'),
('HI00292', 'https://dichvuxunau.vn/wp-content/uploads/2021/09/banh-it-la-gai.jpg', 'DSAN076'),
('HI00293', 'https://punfood.com.vn/wp-content/uploads/2021/06/mat-ca-ngu-dai-duong-ham-thuoc-bac.jpeg.jpeg', 'DSAN077'),
('HI00294', 'https://thodiaphuyen.com.vn/Media/Posts/mat-ca-ngu-phu-yen-1.jpg', 'DSAN077'),
('HI00295', 'https://thodiavn24h.com/wp-content/uploads/2020/06/mat-ca-ngu-dai-duong-dulichchat.jpg', 'DSAN077'),
('HI00296', 'https://palmbeachhotel.vn/wp-content/uploads/2021/05/dac-san-mat-ca-ngu-dai-duong-phu-yen-1.jpg', 'DSAN077'),
('HI00297', 'https://media.mia.vn/uploads/blog-du-lich/Lang-nghe-banh-trang-hoa-da-dac-san-truyen-thong-cua-tinh-phu-yen-02-1637424794.jpg', 'DSAN078'),
('HI00298', 'https://sohanews.sohacdn.com/thumb_w/1000/160588918557773824/2022/8/30/photo-1-1661844808201314113827.jpg', 'DSAN078'),
('HI00299', 'https://media.mia.vn/uploads/blog-du-lich/cung-tim-hieu-mon-banh-trang-hoa-da-dac-san-truyen-thong-phu-yen-01-1637680700.jpg', 'DSAN078'),
('HI00300', 'https://banhtrangsachi.com/wp-content/uploads/2022/09/banh-trang-hoa-da-2.jpg', 'DSAN078'),
('HI00301', 'https://focusasiatravel.vn/wp-content/uploads/2019/12/bun-ca-nha-trang-focusasiatravel.jpg', 'DSAN079'),
('HI00302', 'https://static.vinwonders.com/2022/06/bun-ca-nha-trang-banner.jpg', 'DSAN079'),
('HI00303', 'https://media.mia.vn/uploads/blog-du-lich/ngon-nuc-no-mon-bun-ca-nha-trang-3-1623774254.jpg', 'DSAN079'),
('HI00304', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF4h139GA9_d1XsrwoaJIjdERVNwiXDYU2exSd6EitNw&s', 'DSAN079'),
('HI00305', 'https://tse1.mm.bing.net/th?id=OIP.hNds5j13gC3pPnJuLpXAlgAAAA&pid=Api&P=0&h=180', 'DSAN080'),
('HI00306', 'https://hoangviettravel.vn/wp-content/uploads/2020/09/banh-trang-xoai-nha-trang-min.jpg', 'DSAN080'),
('HI00307', 'https://statics.vinpearl.com/banh-xoai-nha-trang-1_1630809671.jpg', 'DSAN080'),
('HI00308', 'https://uploads-ssl.webflow.com/5e7633ba063fccbda0b1bf20/5eb011a84e3051486708a94d_dac-trung-banh-xoai-nha-trang.jpg', 'DSAN080'),
('HI00309', 'https://hellophanrang.com/wp-content/uploads/2022/05/z3410546102089_598feeb9b4203608a313b860748a6f96.jpg', 'DSAN081'),
('HI00310', 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/10/17/1105978/Du-Lich-Vinh-Hy-Ninh.jpg', 'DSAN081'),
('HI00311', 'https://tse1.mm.bing.net/th?id=OIP.0lYtf1zBnwcDQEORz2ap_gHaHa&pid=Api&P=0&h=180', 'DSAN081'),
('HI00312', 'https://media.mia.vn/uploads/blog-du-lich/bun-sua-ninh-thuan-mon-an-goi-tron-su-tinh-te-cua-nguoi-dau-bep-3-1658222435.jpg', 'DSAN081'),
('HI00313', 'https://tse3.mm.bing.net/th?id=OIP.Oh6afiKclDIZW4-aPIQdKgHaEM&pid=Api&P=0&h=180', 'DSAN082'),
('HI00314', 'https://dacsanchinhgoc.vn/upload/images/nho-ninh-thuan.jpg', 'DSAN082'),
('HI00315', 'https://dacsanninhthuan.vn/wp-content/uploads/2020/07/NhoNinhThuan.jpg', 'DSAN082'),
('HI00316', 'https://ninhthuantravels.com/wp-content/uploads/2023/03/VUON-NHO-SAU-LANG.jpg', 'DSAN082'),
('HI00317', 'https://nongnghieptaynguyen.vn/banhang/images/content_3.jpg', 'DSAN083'),
('HI00318', 'https://bazantravel.com/cdn/medias/uploads/30/30054-ruou-ghe-kon-tum-700x467.jpg', 'DSAN083'),
('HI00319', 'https://media.mia.vn/uploads/blog-du-lich/thu-uong-ruou-ghe-kon-tum-cuc-ngon-cua-vung-dat-cao-nguyen-03-1658875433.jpg', 'DSAN083'),
('HI00320', 'https://nongnghieptaynguyen.vn/banhang/images/sanpham_chitiet_original_01.jpg', 'DSAN083'),
('HI00321', 'https://bazantravel.com/cdn/medias/uploads/27/27900-pho-kho-kon-tum.jpg', 'DSAN084'),
('HI00322', 'https://kontumtrip.com/wp-content/uploads/2021/03/pho-kho-kontum.jpg', 'DSAN084'),
('HI00323', 'http://hinhanhkontum.maytinhhtl.com/images/kon-tum/dac-san-kon-tum/dac-san%20pho-kho-kon-tum-01.jpg', 'DSAN084'),
('HI00324', 'https://media.foody.vn/res/g66/651022/prof/s/foody-mobile-hmbb-jpg-678-636277029911622302.jpg', 'DSAN084'),
('HI00325', 'https://tse3.mm.bing.net/th?id=OIP.aUgFHKobukDvl2Q4eYYgCAHaE8&pid=Api&P=0&h=180', 'DSAN085'),
('HI00326', 'https://diadanhbinhthuan.com/wp-content/uploads/2021/06/banh-can-phan-thiet01-1526713509-1024x682.jpg', 'DSAN085'),
('HI00327', 'https://123tadi.com/wp-content/Uploads/2020/11/29.1.jpg', 'DSAN085'),
('HI00328', 'https://123tadi.com/wp-content/Content/images/29_5(1).jpg', 'DSAN085'),
('HI00329', 'https://phanthietvn.com/wp-content/uploads/2013/10/banh-re-phan-thiet-1.jpg', 'DSAN086'),
('HI00330', 'https://uthadacsan.com/wp-content/uploads/2019/10/banh-re-05.jpg', 'DSAN086'),
('HI00331', 'https://media.mia.vn/uploads/blog-du-lich/thuong-thuc-banh-re-phan-thiet-mon-an-doc-dao-giua-long-pho-bien-01-1657286931.jpeg', 'DSAN086'),
('HI00332', 'https://media.mia.vn/uploads/blog-du-lich/thuong-thuc-banh-re-phan-thiet-mon-an-doc-dao-giua-long-pho-bien-07-1657286932.jpeg', 'DSAN086'),
('HI00333', 'https://nongnghieptaynguyen.vn/banhang/images/content_3.jpg', 'DSAN087'),
('HI00334', 'https://bazantravel.com/cdn/medias/uploads/30/30054-ruou-ghe-kon-tum-700x467.jpg', 'DSAN087'),
('HI00335', 'https://media.mia.vn/uploads/blog-du-lich/thu-uong-ruou-ghe-kon-tum-cuc-ngon-cua-vung-dat-cao-nguyen-03-1658875433.jpg', 'DSAN087'),
('HI00336', 'https://nongnghieptaynguyen.vn/banhang/images/sanpham_chitiet_original_01.jpg', 'DSAN087'),
('HI00337', 'https://1.bp.blogspot.com/-KwBLMFl1M0w/Uqqv94kSriI/AAAAAAAAAdc/xv19WjCzMZI/s1600/ca-phe-sach-osaka_s403.jpg', 'DSAN088'),
('HI00338', 'https://kiotfood.vn/images/thumbs/0004129_ca-phe-pleiku_550.jpeg', 'DSAN088'),
('HI00339', 'https://cattour.vn/images/upload/images/pleiku/cafe-pleiku/ca-phe.jpg', 'DSAN088'),
('HI00340', 'https://tse2.mm.bing.net/th?id=OIP.irHbSpUm9Oo2zI5Juxn9hAHaFj&pid=Api&P=0&h=180', 'DSAN088'),
('HI00341', 'https://toplist.vn/images/800px/cong-ty-ruou-can-hai-tay-nguyen-675142.jpg', 'DSAN089'),
('HI00342', 'https://top10daklak.com/wp-content/uploads/2019/08/R%C6%B0%E1%BB%A3u-c%E1%BA%A7n-Y-Nguy%C3%AAn.jpg', 'DSAN089'),
('HI00343', 'https://ibuyonline.vn/wp-content/uploads/2021/12/ruou-can-dak-lak-2.jpg', 'DSAN089'),
('HI00344', 'https://ibuyonline.vn/wp-content/uploads/2021/12/ruou-can-dak-lak-1.jpg', 'DSAN089'),
('HI00345', 'https://toplist.vn/images/800px/ca-bong-kho-rieng-959508.jpg', 'DSAN090'),
('HI00346', 'https://toplist.vn/images/800px/ca-bong-kho-rieng-959507.jpg', 'DSAN090'),
('HI00347', 'https://thegioihinhanh.com/uploads/images/editor/ca%20bong%20kho%20rieng_1.jpg', 'DSAN090'),
('HI00348', 'https://i.pinimg.com/originals/08/4a/af/084aafa03a4016f8cff50a87aa8c1696.jpg', 'DSAN090'),
('HI00349', 'https://toplist.vn/images/800px/ca-phe-dak-nong-1104401.jpg', 'DSAN091'),
('HI00350', 'https://caphenguyenchat.vn/wp-content/uploads/2019/11/hat-ca-phe-va-nhung-dieu-thu-vi-4-1280x800.jpg', 'DSAN091'),
('HI00351', 'https://toplist.vn/images/800px/ca-phe-nui-gia-nghia-dak-nong-843252.jpg', 'DSAN091'),
('HI00352', 'https://www.homestaygianghia.com/upload/menu/cafe/ca-phe-gia-nghia-dak-nong-8.jpg', 'DSAN091'),
('HI00353', 'https://toplist.vn/images/800px/xoai-dak-gan-1104429.jpg', 'DSAN092'),
('HI00354', 'https://www.yong.vn/Content/images/foods/xoai-dak-gan-dac-nong.jpg', 'DSAN092'),
('HI00355', 'https://daknong.1cdn.vn/2022/06/22/baodaknong.org.vn-database-image-2022-06-22-_3865-kt-6.jpg', 'DSAN092'),
('HI00356', 'https://daknong.1cdn.vn/2019/03/25/baodaknong.org.vn-database-image-2019-03-25-_3005-kt-23.jpg', 'DSAN092'),
('HI00357', 'https://hinhanhdephd.com/wp-content/uploads/2016/01/hinh-anh-qua-dau-dep-6.jpg', 'DSAN093'),
('HI00358', 'https://ncppb.com/wp-content/uploads/2022/11/thumbnail-dau-tay-thuy-canh.png', 'DSAN093'),
('HI00359', 'https://media.loveitopcdn.com/23464/cach-lam-dat-trong-cay-dau-tay-trong-chau.jpg', 'DSAN093'),
('HI00360', 'https://vattunongsan.com/kcfinder/upload/images/dau-tay-trai-to2-1.jpg', 'DSAN093'),
('HI00361', 'https://dulich3mien.vn/wp-content/uploads/2022/01/banh-uot-long-ga-da-lat-1.jpg', 'DSAN094'),
('HI00362', 'https://images.foody.vn/res/g9/86919/s800/foody-quan-long-banh-uot-long-ga-216-637533515018498324.jpg', 'DSAN094'),
('HI00363', 'https://truyenhinhvov.qltns.mediacdn.vn/239964650902032384/2021/6/12/banh-uot-long-gadocx-1623456406647-1623464825394-16234648265131531600347.jpeg', 'DSAN094'),
('HI00364', 'https://phuot3mien.com/wp-content/uploads/2021/07/banh-uot-long-ga-thao.jpeg', 'DSAN094'),
('HI00365', 'https://authentiktravel.com/media/ckeditor/vietnamese%20cuisine%20com%20tam.jpg', 'DSAN095'),
('HI00366', 'https://tayho.com/wp-content/uploads/2020/05/44a.-C%C6%A1m-S%C6%B0%E1%BB%9Dn-e1589128806607.jpg', 'DSAN095'),
('HI00367', 'https://images.foody.vn/res/g119/1184535/prof/s640x400/foody-upload-api-foody-mobile-4e-1e49f1a8-230913154329.jpeg', 'DSAN095'),
('HI00368', 'https://tb-static.uber.com/prod/image-proc/processed_images/67f30ae9bd4a49c469f637eed0c6a685/5954bcb006b10dbfd0bc160f6370faf3.jpeg', 'DSAN095'),
('HI00369', 'https://www.vietfuntravel.com.vn/image/data/Hinh-Sai-Gon/1040.nhung-quan-cafe-via-he-o-sai-gon/nhung-quan-cafe-via-he-o-sai-gon-h5-gigapixel.jpg', 'DSAN096'),
('HI00370', 'https://fnbvietnam.vn/wp-content/uploads/2021/06/bi-quyet-mo-quan-cafe-voi-10-trieu-e1624375910751.jpg', 'DSAN096'),
('HI00371', 'https://classiccoffee.com.vn/upload/xzYyaYzbM7FgfiwHSe76KCpPOdgpqnyXWxw.jpg', 'DSAN096'),
('HI00372', 'https://i.pinimg.com/originals/9b/3d/fc/9b3dfc8a03b98cbe67b0c382a085e3b7.jpg', 'DSAN096'),
('HI00373', 'https://chefjob.vn/wp-content/uploads/2018/08/banh-mi-thit-sai-gon.jpg', 'DSAN097'),
('HI00374', 'https://image.phunuonline.com.vn/fckeditor/upload/2023/20230406/images/7110_1662420115-shutterstock-1713347764-huge-2-1.jpg', 'DSAN097'),
('HI00375', 'https://halotravel.vn/wp-content/uploads/2019/10/69562047_2351524125065377_8523803044606594886_n.jpg', 'DSAN097'),
('HI00376', 'https://wiki-travel.com.vn/uploads/picture/hieuhieu-191320011307-banh-mi-thit-nuong-nguyen-trai.jpg', 'DSAN097'),
('HI00377', 'https://cdn.tgdd.vn/Files/2020/06/30/1266676/cach-lam-bot-chien-trung-ngoai-gion-trong-mem-chuan-vi-sai-gon-202206041533314655.jpg', 'DSAN098'),
('HI00378', 'https://cdn.tgdd.vn/Files/2021/08/26/1378121/cach-lam-mon-bot-chien-tu-com-nguoi-vua-de-vua-ngon-khong-can-hap-202201101701192405.jpeg', 'DSAN098'),
('HI00379', 'https://wiki-travel.com.vn/uploads/picture/qiongru-182717022752-bot-chien.jpg', 'DSAN098'),
('HI00380', 'https://songkhoe.medplus.vn/wp-content/uploads/2020/03/C%C3%A1-t%E1%BA%A9m-b%E1%BB%99t-r%C3%A1n-gi%C3%B2n-1.jpg', 'DSAN098'),
('HI00381', 'https://dasavina.org/wp-content/uploads/2014/02/Goi-buoi-tan-trieu.jpg', 'DSAN099'),
('HI00382', 'https://fyrsmith.com/wp-content/uploads/2021/12/buoi10.jpg', 'DSAN099'),
('HI00383', 'https://www.sgtiepthi.vn/wp-content/uploads/2021/05/goibuoiDN_2-01.jpg', 'DSAN099'),
('HI00384', 'https://banhtrangsachi.com/wp-content/uploads/2021/11/goi-buoi-2.jpg', 'DSAN099'),
('HI00385', 'https://danviet.mediacdn.vn/upload/1-2017/images/2017-03-21/14900378621556-bduong_la_cam.jpg', 'DSAN100'),
('HI00386', 'https://inhat.vn/wp-content/uploads/2020/08/B%C6%B0%E1%BB%9Fi-T%C3%A2n-Tri%E1%BB%81u.jpg', 'DSAN100'),
('HI00387', 'https://www.tourdulichbentre.com/images/chon-buoi-lam-mon-ga.jpg', 'DSAN100'),
('HI00388', 'https://tinicart.vn/wp-content/uploads/2021/05/buoi-xoai.jpg', 'DSAN100'),
('HI00389', 'http://topplus.vn/Userfiles/Upload/images/d7491858e8ee4414bc19c07376cb253e.jpg', 'DSAN101'),
('HI00390', 'http://topplus.vn/Userfiles/Upload/images/XOI%201.jpg', 'DSAN101'),
('HI00391', 'http://topplus.vn/Userfiles/Upload/images/643d714dd15d46e8ab168267823be067.jpg', 'DSAN101'),
('HI00392', 'https://cdn.tgdd.vn/2020/07/CookProduct/s-1200x676.jpg', 'DSAN101'),
('HI00393', 'https://grf.vn/wp-content/uploads/2021/04/banh-beo-bi-binh-duong-mon-an-don-gian-nhung-vo-cung-ngon-undefined-48018033.jpg', 'DSAN102'),
('HI00394', 'https://image-us.24h.com.vn/upload/1-2021/images/2021-03-24/1-1616557866-568-width800height500.jpg', 'DSAN102'),
('HI00395', 'https://i.pinimg.com/originals/b9/2b/00/b92b00b0d9508093a63212eff3ec4566.jpg', 'DSAN102'),
('HI00396', 'https://thegioiamthuc.com/wp-content/uploads/2017/09/banh-beo-bi-600x400.jpg', 'DSAN102'),
('HI00397', 'https://www.tourdulichbentre.com/images/bo-nuong-ngoi-binh-duong.jpg', 'DSAN103'),
('HI00398', 'https://ngonaz.com/wp-content/uploads/2021/09/cach-lam-bo-nuong-ngoi-1.jpg', 'DSAN103'),
('HI00399', 'https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/nuong-ngoi-sai-gon-1-1-e1625736538658.jpeg', 'DSAN103'),
('HI00400', 'https://www.monngon.tv/uploads/images/images/bo-nuong-ngoi-1.jpg', 'DSAN103'),
('HI00401', 'https://thucthan.com/media/2018/09/mut-gung/mut-gung.jpg', 'DSAN104'),
('HI00402', 'https://topchuan.com/wp-content/uploads/2019/09/Mut-gung-Binh-Nham-2.jpg', 'DSAN104'),
('HI00403', 'https://wiki-travel.com.vn/uploads/post/thanhhuong-184908034933-mut-tet.jpg', 'DSAN104'),
('HI00404', 'https://vitinfo.com.vn/wp-content/uploads/2018/05/mutnghe002.png', 'DSAN104'),
('HI00405', 'https://langbun.vn/wp-content/uploads/2023/10/bun-hai-san-3.jpg', 'DSAN105'),
('HI00406', 'https://cosopho.com/wp-content/uploads/2021/08/1.Cach-lam-mon-bun-hai-san-thom-ngon.jpg', 'DSAN105'),
('HI00407', 'https://haisankieuhung.com/wp-content/uploads/2020/02/cach-lam-bun-hai-san-ngon-don-gian-tai-nha.png', 'DSAN105'),
('HI00408', 'https://haisanxanh.com/uploads/images/cach-nau-bun-hai-san.jpg', 'DSAN105'),
('HI00409', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/05_2022/goi-ca-mai-vung-tau.jpg', 'DSAN106'),
('HI00410', 'https://ticotravel.com.vn/wp-content/uploads/2022/05/goi-ca-mai-vung-tau-4.jpg', 'DSAN106'),
('HI00411', 'https://www.amthuccotruyen.com/images/2020/goi-ca-mai.jpg', 'DSAN106'),
('HI00412', 'https://thegioiamthuc.com/wp-content/uploads/2018/07/goi-ca-mai-600x399.jpg', 'DSAN106'),
('HI00413', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/11_2022/com-lam-binh-phuoc-mot.jpg', 'DSAN107'),
('HI00414', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/11_2022/com-lam-binh-phuoc-hai.jpg', 'DSAN107'),
('HI00415', 'https://4.bp.blogspot.com/-WK0EWQGzumo/VuPbWTm91KI/AAAAAAAABCE/mKKNtfIY3oMnzpnOnlpT868t1CVn_iN9A/s1600/com-lam-dac-san-binh-phuoc.jpg', 'DSAN107'),
('HI00416', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/11_2022/com-lam-binh-phuoc-0.jpg', 'DSAN107'),
('HI00417', 'https://bloganchoi.com/wp-content/uploads/2018/06/qua-nhan-cover.jpg', 'DSAN108'),
('HI00418', 'https://danviet.mediacdn.vn/296231569849192448/2022/6/13/nhansieutrai-1655107231744846576758-1655108839126218302105.jpeg', 'DSAN108'),
('HI00419', 'https://pitayavn.com/upload/files/sanpham/nhan-long-pho-hien-300x300.jpg', 'DSAN108'),
('HI00420', 'https://images.tcdn.com.br/img/img_prod/912574/90_muda_logan_olho_de_dragao_alporquia_150_cm_639_1_b7c72871cbb617b36aa56edcaef12a46.jpg', 'DSAN108'),
('HI00421', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-binh-phuoc-1-1024x686.jpeg', 'DSAN109'),
('HI00422', 'https://3.bp.blogspot.com/-tArQRBiBfog/VuPPIZtKxTI/AAAAAAAABBg/DKSSaN9Tn3cpr7CJAjeP0XoFsbWaRDgWA/s1600/goi-hat-dieu-dac-san-binh-phuoc-02.jpg', 'DSAN109'),
('HI00423', 'https://media.mia.vn/uploads/blog-du-lich/chua-chua-vi-goi-trai-dieu-ai-tung-an-chi-muon-som-quay-lai-binh-phuoc-2-1657027874.jpg', 'DSAN109'),
('HI00424', 'https://saigonangi.com/wp-content/uploads/2021/08/bp1.jpg', 'DSAN109'),
('HI00425', 'https://diachiamthuc.vn/wp-content/uploads/2023/04/Dac-san-Bo-to-Tay-Ninh.jpg', 'DSAN110'),
('HI00426', 'https://statics.vinpearl.com/bo-to-tay-ninh-9_1631970741.jpg', 'DSAN110'),
('HI00427', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/bo-to-tay-ninh-nam-sanh-pham-hung-3.jpg', 'DSAN110'),
('HI00428', 'https://statics.vinpearl.com/bo-to-tay-ninh-4_1631970595.jpg', 'DSAN110'),
('HI00429', 'https://monkeymedia.vcdn.com.vn/upload/web/storage_web/26-06-2022_11:07:22_dinh-duong-dua-luoi.jpg', 'DSAN111'),
('HI00430', 'https://cdn.tgdd.vn/Files/2021/11/04/1395633/tong-hop-cac-loai-giong-dua-luoi-pho-bien-hien-nay-co-the-ban-chua-biet-202111040909509785.jpg', 'DSAN111'),
('HI00431', 'https://cdn.tgdd.vn/2021/05/CookProduct/Cachchondualuoingon(1)-1200x676.jpg', 'DSAN111'),
('HI00432', 'https://www.fao.org.vn/wp-content/uploads/2020/03/trong-dua-luoi.jpg', 'DSAN111'),
('HI00433', 'https://datviettour.com.vn/uploads/images/tin-tuc-SEO/mien-nam/tay-ninh/am-thuc/oc-xu-nui-ba.jpg', 'DSAN112'),
('HI00434', 'https://img.ihappyday.tw/2019/09/1567815372-1b026ceb24069ab81478139e3cd9e3d3.jpg', 'DSAN112'),
('HI00435', 'https://img-global.cpcdn.com/recipes/8295c02552c1e70a/1200x630cq70/photo.jpg', 'DSAN112'),
('HI00436', 'https://img-global.cpcdn.com/recipes/23d740ac73a6698d/1200x630cq70/photo.jpg', 'DSAN112'),
('HI00437', 'https://sakos.vn/wp-content/uploads/2023/05/dac-san-long-an-co-gi.jpg', 'DSAN113'),
('HI00438', 'https://mustgo.vn/files/uploads/1566493239-vnf02-3518-01.jpg', 'DSAN113'),
('HI00439', 'https://cdn.tgdd.vn/2021/01/CookProduct/1200676donha-1200x676.jpg', 'DSAN113'),
('HI00440', 'https://amthucvietnam365.vn/wp-content/uploads/2022/01/thit-lon-muoi-chua-1.jpeg', 'DSAN113'),
('HI00441', 'https://www.vietfuntravel.com.vn/image/data/Mekong/dac-san-long-an-canh-chua-ca-chot-3.jpg', 'DSAN114'),
('HI00442', 'https://cdn.tgdd.vn/2021/01/content/39-800x500.jpg', 'DSAN114'),
('HI00443', 'https://www.thatlangon.com/wp-content/uploads/2021/09/canh-chua-ca-tln1-e1633942511539.jpg', 'DSAN114'),
('HI00444', 'https://cdn.tgdd.vn/2020/10/CookRecipe/Avatar/canh-chua-ca-linh-thumbnail.jpg', 'DSAN114');
INSERT INTO `Hinh_DacSan` (`IDHinh`, `LinkAnh`, `IDDacSan`) VALUES
('HI00445', 'https://dongangia.com/files/news/trong-cay-thanh-long-trong-chau-ban-da-thu-chua-z7lg0zvr.jpg', 'DSAN115'),
('HI00446', 'https://d2v9opmik2a3uk.cloudfront.net/uploads/2015/09/06161806/530a114e2504fc375126ee4486d7ffbd.jpg', 'DSAN115'),
('HI00447', 'https://i.pinimg.com/originals/55/ec/70/55ec70e2ad897ec369dfa9393ec49215.jpg', 'DSAN115'),
('HI00448', 'https://nongsandungha.com/wp-content/uploads/cay-thanh-long-do.jpg', 'DSAN115'),
('HI00449', 'https://dacsandongthapmuoi.vn/files/upload/san-pham/san-pham-xuat-xu-vung-dong-thap-muoi/nem-lai-vung-1-chuc-02.jpg', 'DSAN116'),
('HI00450', 'https://cdn3.ivivu.com/2022/12/cach-lam-nem-lai-vung-1609922670810963458301.jpg', 'DSAN116'),
('HI00451', 'https://cdn3.ivivu.com/2022/12/1799_du_lich_dong_thap_nho_nem_thu_nem_lai_vung.jpg', 'DSAN116'),
('HI00452', 'https://canthomekongtour.com/static/media/nem-chua050721.jpg', 'DSAN116'),
('HI00453', 'https://cdn.tgdd.vn/2020/10/CookProduct/1-1200x676-46.jpg', 'DSAN117'),
('HI00454', 'https://assets.telegraphindia.com/abp/2023/Jun/1686553465_new-project-77.jpg', 'DSAN117'),
('HI00455', 'https://i.pinimg.com/736x/08/e5/f4/08e5f47c1e177b8d16a0b660e7544786.jpg', 'DSAN117'),
('HI00456', 'https://static.thairath.co.th/media/Dtbezn3nNUxytg04aiKBzVMuW4M6V9o7la06M5QFho4hLD.jpg', 'DSAN117'),
('HI00457', 'https://mmvietnam.com/wp-content/uploads/2021/09/Hu-tieu-sadec.jpg', 'DSAN118'),
('HI00458', 'https://jgwaste.com/wp-content/uploads/2021/08/hu-tieu-da-dec.jpg', 'DSAN118'),
('HI00459', 'https://doanhnhanplus.vn/wp-content/uploads/2019/03/dnp795-hu-tiu-sa-dec-am-thuc-260319.jpg', 'DSAN118'),
('HI00460', 'https://noipho360.vn/wp-content/uploads/2022/08/hu-tieu-sa-dec.jpg', 'DSAN118'),
('HI00461', 'https://cdn.vn.alongwalk.info/wp-content/uploads/2023/02/01181512/image-cac-quan-ban-bun-ca-ngon-o-an-giang-lam-say-long-thuc-khach-167522491117802.jpg', 'DSAN119'),
('HI00462', 'https://cdn.tgdd.vn/2020/10/CookProduct/1-1200x676-46.jpg', 'DSAN119'),
('HI00463', 'https://assets.telegraphindia.com/abp/2023/Jun/1686553465_new-project-77.jpg', 'DSAN119'),
('HI00464', 'https://i.pinimg.com/736x/08/e5/f4/08e5f47c1e177b8d16a0b660e7544786.jpg', 'DSAN119'),
('HI00465', 'https://yeubepviet.com/wp-content/uploads/2020/08/Ch%C3%A8-th%E1%BB%91t-n%E1%BB%91t-an-giang.jpg', 'DSAN120'),
('HI00466', 'https://dantri4.vcmedia.vn/ERFfpJncaSbiKh2gBx37rOzrUfJP/Image/2020/08/CheThotNot20200723233507659-2d944.jpg', 'DSAN120'),
('HI00467', 'https://cafefcdn.com/thumb_w/650/2019/12/6/photo1575592571980-1575592571980668780494.jpg', 'DSAN120'),
('HI00468', 'https://cdn.baogiaothong.vn/files/phamnhi_9-11-2018_15_56_24-3793.jpg', 'DSAN120'),
('HI00469', 'https://cdn.vietnammoi.vn/171464242508312576/2020/11/18/foody-hieu-mien-lau-mam-402-636553634603474244-1605693130291210997068.jpg', 'DSAN121'),
('HI00470', 'https://img-global.cpcdn.com/recipes/cf8ae347462b11fc/751x532cq70/lau-mam-chau-doc-an-giang-sieu-ngon-chieu-da-an-ngay-cho-ma-heo-can-heo-bi-chua-cay-recipe-main-photo.jpg', 'DSAN121'),
('HI00471', 'https://hongphucphoto.com/wp-content/uploads/2019/05/L%E1%BA%A7u-m%E1%BA%AFm-ch%E1%BA%A2u-%C4%91%E1%BB%91c-2-1024x683.jpg', 'DSAN121'),
('HI00472', 'https://dacsangatdinh.com/wp-content/uploads/2022/08/l%E1%BA%A7u-m%E1%BA%AFm-1-1024x768.jpg', 'DSAN121'),
('HI00473', 'https://media.mia.vn/uploads/blog-du-lich/goi-so-long-hoa-chuoi-dac-san-kien-giang-van-nguoi-me-04-1666744377.jpeg', 'DSAN122'),
('HI00474', 'https://media.mia.vn/uploads/blog-du-lich/goi-so-long-hoa-chuoi-dac-san-kien-giang-van-nguoi-me-01-1666732332.jpeg', 'DSAN122'),
('HI00475', 'https://media.cooky.vn/recipe/g5/41414/s800x500/cooky-recipe-636757998055275307.jpg', 'DSAN122'),
('HI00476', 'https://cdn.tgdd.vn/2020/07/CookRecipe/Avatar/goi-ga-hoa-chuoi-thumbnail-1.jpg', 'DSAN122'),
('HI00477', 'https://media.mia.vn/uploads/blog-du-lich/lau-chua-sa-nghe-ca-nham-giau-tinh-hoa-am-thuc-tay-nam-bo-03-1666735729.jpeg', 'DSAN123'),
('HI00478', 'https://hotel84.com/hotel84-images/news/img1/lau-chua-sa-nghe-ca-nham-giau-kien-giang.jpg', 'DSAN123'),
('HI00479', 'https://media.mia.vn/uploads/blog-du-lich/lau-chua-sa-nghe-ca-nham-giau-tinh-hoa-am-thuc-tay-nam-bo-01-1666735034.jpeg', 'DSAN123'),
('HI00480', 'https://duyendangvietnam.net.vn/public/uploads/images/ca%20nham(1).jpg', 'DSAN123'),
('HI00481', 'https://cdn.tgdd.vn/Files/2019/03/14/1154630/diem-danh-cac-loai-sau-rieng-duoc-ua-chuong-nhat-1_700x400.jpg', 'DSAN124'),
('HI00482', 'https://cdn.tgdd.vn/Files/2019/03/14/1154630/diem-danh-cac-loai-sau-rieng-duoc-ua-chuong-nhat-2_700x400.jpg', 'DSAN124'),
('HI00483', 'https://cdn.tgdd.vn/Files/2019/03/14/1154630/diem-danh-cac-loai-sau-rieng-duoc-ua-chuong-nhat-3_700x400.jpg', 'DSAN124'),
('HI00484', 'https://cdn.tgdd.vn/Files/2019/03/14/1154630/diem-danh-cac-loai-sau-rieng-duoc-ua-chuong-nhat-4_700x400.jpg', 'DSAN124'),
('HI00485', 'https://buffetposeidon.com/storage/app/media/Kham-pha-am-thuc/10.2022/251022-cua-ca-mau-buffet-poseidon-2.jpg', 'DSAN125'),
('HI00486', 'https://tepbac.com/upload/news/ge_image/2023/01/cua-ca-mau_1674747479.jpg', 'DSAN125'),
('HI00487', 'https://haisantrungnam.vn/wp-content/uploads/2020/03/cua-gach-son-ca-mau-600x600.jpg', 'DSAN125'),
('HI00488', 'https://hieuhaisan.com/contents_hieuhaisan/uploads/images/cua-ca-mau-08.jpg', 'DSAN125'),
('HI00489', 'https://unisea.vn/media/news/3107_ca-thoi-loi-nuong-muoi-ot-01.JPG', 'DSAN126'),
('HI00490', 'https://image-us.eva.vn/upload/3-2019/images/2019-09-10/ca-thoi-loi-nuong-muoi-ot-ngon-tru-danh-o-vung-dat-mui-314_ca_thoi_loi_nuong_muoi_ot-1568100872-170-width640height400.jpg', 'DSAN126'),
('HI00491', 'https://wcolditz.com/wp-content/uploads/2021/08/maxresdefault-31.jpg', 'DSAN126'),
('HI00492', 'https://asset-a.grid.id/crop/0x0:0x0/945x630/photo/grid/original/113470_bakar-ikan-nggak-lengkap-kalau-tanpa-bumbu-olesan.jpg', 'DSAN126'),
('HI00493', 'https://vienthiacanh.vn/sites/default/files/anh_bai_viet/trai-nhan.JPG', 'DSAN127'),
('HI00494', 'https://vienthiacanh.vn/sites/default/files/anh_bai_viet/nhan-long.JPG', 'DSAN127'),
('HI00495', 'https://vienthiacanh.vn/sites/default/files/anh_bai_viet/ngan-ngua-nguy-co-gay-ung-thu.JPG', 'DSAN127'),
('HI00496', 'https://vienthiacanh.vn/sites/default/files/anh_bai_viet/trai-nhan.JPG', 'DSAN127'),
('HI00497', 'https://cdn.tgdd.vn/Files/2021/08/30/1379043/cach-nau-lau-mam-ca-linh-ngon-dung-chuan-vi-don-gian-tai-nha-202201060142070358.jpeg', 'DSAN128'),
('HI00498', 'https://toplist.vn/images/800px/lau-mam-kieu-trinh-563220.jpg', 'DSAN128'),
('HI00499', 'https://digifood.vn/blog/wp-content/uploads/2021/05/157130438_481825129864817_1576602809525853104_n.jpg', 'DSAN128'),
('HI00500', 'https://media.mia.vn/uploads/blog-du-lich/lau-mam-an-giang-mon-an-dai-dien-cho-nen-am-thuc-mien-dat-tay-nam-04-1661323984.jpeg', 'DSAN128'),
('HI00501', 'https://cosopho.com/wp-content/uploads/2021/08/1.cong-thuc-nau-bun-nuoc-leo-lam-say-dam-long-thuc-khac.jpg', 'DSAN129'),
('HI00502', 'https://media.cooky.vn/recipe/g1/5678/s800x500/recipe5678-636252771341806468.jpg', 'DSAN129'),
('HI00503', 'https://webamthuc.vn/wp-content/uploads/2017/10/1-bun-nuoc-leo.jpg', 'DSAN129'),
('HI00504', 'https://i.ytimg.com/vi/jnm0vyBR504/maxresdefault.jpg', 'DSAN129'),
('HI00505', 'https://fsfamily.vn/wp-content/uploads/2019/01/1-38.jpg', 'DSAN130'),
('HI00506', 'https://fsfamily.vn/wp-content/uploads/2019/01/2-39.jpg', 'DSAN130'),
('HI00507', 'https://fsfamily.vn/wp-content/uploads/2019/01/3-39.jpg', 'DSAN130'),
('HI00508', 'https://www.btaskee.com/wp-content/uploads/2021/08/Thanh-pham-che-ba-ba.jpg', 'DSAN130'),
('HI00509', 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/08/ca-bong-sao-thom-ngon.png', 'DSAN131'),
('HI00510', 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/08/ca-bong-sao-soc-trang.png', 'DSAN131'),
('HI00511', 'https://1.bp.blogspot.com/-QNRA-rkA660/UrEps1P1mkI/AAAAAAAABZA/v95jcTeUppA/s1600/ca-bong-sao.jpg', 'DSAN131'),
('HI00512', 'https://media.mia.vn/uploads/blog-du-lich/thuong-thuc-ca-bong-sao-soc-trang-voi-huong-vi-dam-da-kho-quen-5-1664189547.jpg', 'DSAN131'),
('HI00513', 'https://thegioiamthuc.com/wp-content/uploads/2018/08/hu-tieu-ca-ri-vinh-chau-soc-trang.jpg', 'DSAN132'),
('HI00514', 'https://blacksheeprestaurants.com/wp-content/uploads/2018/09/4a36acaf2edda3cc2005976103e93901203f9289-300x242.jpg', 'DSAN132'),
('HI00515', 'https://cdn.idntimes.com/content-images/community/2017/08/sop-kambing-pedas-8a20202a4380424e3fa31187c177d876.jpg', 'DSAN132'),
('HI00516', 'https://cdn.idntimes.com/content-images/community/2021/02/fromandroid-0c2c2e9263d143a031a25106866ba4b0_600x400.jpg', 'DSAN132'),
('HI00517', 'https://canthomekongtour.com/static/media/Thao/8/banh-pia-soc-trang.png', 'DSAN133'),
('HI00518', 'https://i.ytimg.com/vi/FhKcTdOQYZU/maxresdefault.jpg', 'DSAN133'),
('HI00519', 'https://manganhthu.com/wp-content/uploads/2021/03/cach-lam-banh-pia-chuoi-xanh-ngon-don-gian-2.jpg', 'DSAN133'),
('HI00520', 'https://image-us.eva.vn/upload/4-2019/images/2019-06-28/banh-pia-soc-trang-hut-khach-vi-chua-ngot-cua-sau-rieng-4-1561705885-507-width600height400.jpg', 'DSAN133'),
('HI00521', 'https://hiepsi.vn/wp-content/uploads/2019/06/B%C3%A1nh-Tr%C3%A1ng-Ph%C6%A1i-S%C6%B0%C6%A1ng-C%E1%BB%95ng-L%C3%A0-%C4%90%E1%BB%8Fng-Ha-1.jpg', 'DSAN134'),
('HI00522', 'https://hiepsi.vn/wp-content/uploads/2019/06/B%C3%A1nh-Tr%C3%A1ng-Ph%C6%A1i-S%C6%B0%C6%A1ng-C%E1%BB%95ng-L%C3%A0-%C4%90%E1%BB%8Fng-Ha-2.jpg', 'DSAN134'),
('HI00523', 'https://hiepsi.vn/wp-content/uploads/2019/06/B%C3%A1nh-Tr%C3%A1ng-Ph%C6%A1i-S%C6%B0%C6%A1ng-C%E1%BB%95ng-L%C3%A0-%C4%90%E1%BB%8Fng-Ha-5.jpg', 'DSAN134'),
('HI00524', 'https://dulichvietnam.vn/wp-content/uploads/2022/06/banh-trang-phoi-suon-ben-tre-hap-dan-du-khach-12.jpg', 'DSAN134'),
('HI00525', 'https://cdn.ivivu.com/2021/06/2-19.jpg', 'DSAN135'),
('HI00526', 'https://cdn.ivivu.com/2021/06/2-18.jpg', 'DSAN135'),
('HI00527', 'https://cdn.ivivu.com/2021/06/2-17.jpg', 'DSAN135'),
('HI00528', 'https://cdn.ivivu.com/2021/06/2-16.jpg', 'DSAN135'),
('HI00529', 'https://i.ytimg.com/vi/gVlSnIcpd6k/maxresdefault.jpg', 'DSAN136'),
('HI00530', 'https://toquoc.mediacdn.vn/280518851207290880/2022/12/27/anh-quynh-huong-1-16721165445491927223411.jpg', 'DSAN136'),
('HI00531', 'https://cdn.tgdd.vn/Files/2020/03/06/1240540/cach-lam-bun-suong-thom-ngon-dam-da-huong-vi-mien-tay-760x367.jpg', 'DSAN136'),
('HI00532', 'https://i.ytimg.com/vi/3HNjt5YWJVA/maxresdefault.jpg', 'DSAN136'),
('HI00533', 'https://khoinghieptre.tuoitrethudo.com.vn/stores/news_dataimages/khoinghieptretuoitrethudocomvn/082020/19/07/nhung-cong-dung-cua-trai-quach-khien-ban-bat-ngo-33-.4002.png', 'DSAN137'),
('HI00534', 'https://pbs.twimg.com/media/DZDOrZLWsAAwqX6.jpg', 'DSAN137'),
('HI00535', 'https://images.herzindagi.info/image/2023/Jul/bael-recipes-you-should-try-at-home.jpg', 'DSAN137'),
('HI00536', 'https://www.tanamanmart.com/wp-content/uploads/2017/01/KAWIS-2.jpg', 'DSAN137'),
('HI00537', 'https://www.vietfuntravel.com.vn/image/data/Mekong/dac-san-tra-vinh-chao-am-1.png', 'DSAN138'),
('HI00538', 'https://afamilycdn.com/thumb_w/600/Images/Uploaded/Share/2010/12/16/chaoam.jpg', 'DSAN138'),
('HI00539', 'https://checkinvietnam.com.vn/wp-content/uploads/2020/08/chao-am.jpg', 'DSAN138'),
('HI00540', 'https://checkinvietnam.com.vn/wp-content/uploads/2020/08/chao-am1.jpg', 'DSAN138'),
('HI00541', 'https://image.cooky.vn/recipe/g6/50735/s/cooky-recipe-cover-r50735.jpg', 'DSAN139'),
('HI00542', 'https://digifood.vn/blog/wp-content/uploads/2022/06/nuoc-cot-dua-lam-mon-gi-banh-xeo.jpg', 'DSAN139'),
('HI00543', 'https://tomimarkets.net/wp-content/uploads/2020/06/banh-xeo-1-Tomimarkets.jpg', 'DSAN139'),
('HI00544', 'https://iwata-fukuroi-kakegawa.goguynet.jp/wp-content/uploads/2022/11/banhmi.jpg', 'DSAN139'),
('HI00545', 'https://cdn.tgdd.vn/Files/2022/04/25/1428387/gioi-thieu-vai-thieu-nguon-goc-xuat-xu-mua-vai-thieu-khi-nao-202204251536015987.jpg', 'DSAN140'),
('HI00546', 'https://cdn.tgdd.vn/Files/2022/04/27/1428735/vai-thieu-tac-dung-doi-voi-suc-khoe-phan-loai-va-cach-che-bien-202207091604078558.jpg', 'DSAN140'),
('HI00547', 'https://cdn.tgdd.vn/Files/2022/04/27/1428735/tim-hieu-ve-vai-thieu-phan-loai-tac-dung-bao-nhieu-calo-202204271014307764.jpg', 'DSAN140'),
('HI00548', 'https://cdn.tgdd.vn/Files/2022/04/27/1428735/tim-hieu-ve-vai-thieu-phan-loai-tac-dung-bao-nhieu-calo-202204271015017535.jpg', 'DSAN140'),
('HI00549', 'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_680/v1596028661/blog/z8zrrl6hq22o4zpubdwn.jpg', 'DSAN141'),
('HI00550', 'https://recepty-kulinara.ru/wp-content/uploads/2018/11/rebrichki-govyagie.jpg', 'DSAN141'),
('HI00551', 'https://www.sffar.com/wp-content/uploads/2019/01/%D9%85%D9%86%D9%8A%D9%88-%D9%83%D8%A8%D8%A7%D8%A8%D8%AC%D9%8A-%D8%A7%D9%84%D8%B1%D9%81%D8%A7%D8%B9%D9%8A-1-614x330.jpg', 'DSAN141'),
('HI00552', 'https://i.pinimg.com/originals/a6/81/6d/a6816dfd062b55959e35aa7bce060829.jpg', 'DSAN141'),
('HI00553', 'https://znews-photo.zadn.vn/w660/Uploaded/ofh_huqfztmf/2019_09_01/1_banh_hu_tieu.jpg', 'DSAN142'),
('HI00554', 'https://media-cdn.tripadvisor.com/media/photo-s/1b/38/a1/0a/hu-tieu-my-tho.jpg', 'DSAN142'),
('HI00555', 'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_1000/https://tphcm.bepgiadinh.com/wp-content/uploads/2022/01/hu-tieu-my-tho-1.jpg', 'DSAN142'),
('HI00556', 'https://cdn.huongnghiepaau.com/wp-content/uploads/2021/06/kinh-nghiem-chon-mua-hu-tieu-ngon.jpg', 'DSAN142'),
('HI00557', 'https://image.thanhnien.vn/768/uploaded/hoanganh/2018_07_18/2018_07_18_144913_trai_bo_nbon_ben_tre_QMYM.jpg', 'DSAN143'),
('HI00558', 'https://suckhoedoisong247.com/wp-content/uploads/2022/06/cay-bo-non.jpeg', 'DSAN143'),
('HI00559', 'https://cdn.tgdd.vn/Files/2022/04/27/1428735/vai-thieu-tac-dung-doi-voi-suc-khoe-phan-loai-va-cach-che-bien-202207091604078558.jpg', 'DSAN143'),
('HI00560', 'https://cdn.vietnambiz.vn/stores/news_dataimages/phuonggiang/092019/25/14/trai-bo-non.jpg', 'DSAN143'),
('HI00561', 'https://daynauan.info.vn/wp-content/uploads/2018/04/ca-loc-nuong-trui.jpg', 'DSAN144'),
('HI00562', 'https://www.nhahangquangon.com/wp-content/uploads/2018/04/ca-loc-nuong-trui-750x503.jpg', 'DSAN144'),
('HI00563', 'https://banhran.vn/wp-content/uploads/2021/12/ca-loc-nuong-trui3.jpeg', 'DSAN144'),
('HI00564', 'https://scontent.iocvnpt.com/resources/portal/Images/CTO/adminportal.cto/tintuc/t9/ca_loc/ca_loc_an_292528949.jpg', 'DSAN144'),
('HI00565', 'https://i.ytimg.com/vi/yk3eM_exu6U/maxresdefault.jpg', 'DSAN145'),
('HI00566', 'https://nauantainha.com/wp-content/uploads/cooked/images/recipes/recipe_2828.jpg', 'DSAN145'),
('HI00567', 'https://helenrecipes.com/wp-content/uploads/2021/07/Screenshot-2021-07-15-164950-1024x576.png', 'DSAN145'),
('HI00568', 'https://www.cet.edu.vn/wp-content/uploads/2018/12/oc-len-xao-dua.jpg', 'DSAN145'),
('HI00569', 'https://i.ytimg.com/vi/ahZvakiL2GA/maxresdefault.jpg', 'DSAN146'),
('HI00570', 'https://i.imgur.com/6IVxM3V.jpg', 'DSAN146'),
('HI00571', 'https://images.squarespace-cdn.com/content/v1/614a009b2cb9af680ff625f7/1634061618710-CIWWC7VD8YQ4SO2TBOKI/8+copy+2+-+herman+herman+(1).jpg', 'DSAN146'),
('HI00572', 'https://dulichngoaingukientam.com/wp-content/uploads/2022/10/qua-luu-niem-hue-7_1631329854.jpeg', 'DSAN146'),
('HI00573', 'https://media.mia.vn/uploads/blog-du-lich/nem-nuong-cai-rang-huong-vi-dam-da-cua-can-tho-2-1649231593.jpg', 'DSAN147'),
('HI00574', 'https://image.vietnamnews.vn/uploadvnnews/Article/2018/3/9/nem-nuong-cai-rang-can-tho98045144PM.jpg', 'DSAN147'),
('HI00575', 'https://topnlist.com/wp-content/uploads/2020/06/nem-nuong-nha-trang-3.jpg', 'DSAN147'),
('HI00576', 'https://i.ytimg.com/vi/CkwvTBZXB50/hqdefault.jpg', 'DSAN147'),
('HI00577', 'https://tourcantho.vn/wp-content/uploads/banh-cong-can-tho-b.jpg', 'DSAN148'),
('HI00578', 'https://www.tourdulichbentre.com/images/banh-cong-can-tho.jpg', 'DSAN148'),
('HI00579', 'https://2.bp.blogspot.com/-Fxn5zZHsQzk/VuKJofeo9nI/AAAAAAAABBA/5bFN6KJQgKAFOSYLX6y1p8x-Z9HZ5Tg-w/s1600/banh-cong-dac-san-can-tho-01.jpg', 'DSAN148'),
('HI00580', 'https://toplistcantho.com/wp-content/uploads/2020/07/quan-banh-cong-ngon-o-can-tho-1.jpg', 'DSAN148'),
('HI00581', 'https://songkhoe.medplus.vn/wp-content/uploads/2019/11/L%E1%BB%A3i-%C3%ADch-c%E1%BB%A7a-5-1-1.png', 'DSAN149'),
('HI00582', 'https://traicaycaonghe.vn/wp-content/uploads/2021/05/dauxanh10.jpg', 'DSAN149'),
('HI00583', 'https://traicaycaonghe.vn/wp-content/uploads/2021/05/dauxanh7.jpg', 'DSAN149'),
('HI00584', 'https://th.bing.com/th/id/OIP.FTtorqwmuCiTrqa3GDpHJAHaKX?w=514&h=720&rs=1&pid=ImgDetMain', 'DSAN149'),
('HI00585', 'https://sakos.vn/wp-content/uploads/2023/10/pho-ha-noi-09_1677399161.jpg', 'DSAN029'),
('HI00586', 'https://static.vinwonders.com/production/pho-bo-ha-noi.jpeg', 'DSAN029'),
('HI00587', 'https://sakos.vn/wp-content/uploads/2023/10/bun-thang-1.jpeg', 'DSAN030'),
('HI00588', 'https://sakos.vn/wp-content/uploads/2023/10/chop-lay-7-quan-mien-tron-ha-noi-ngon-dinh-cao-nhat-dinh-phai-thu-1639362043.jpg', 'DSAN031'),
('HI00589', 'https://sakos.vn/wp-content/uploads/2023/10/bun-cha-ha-noi-tu-lam.jpg', 'DSAN032'),
('HI00590', 'https://sakos.vn/wp-content/uploads/2023/10/bun-dau-mam-tom.jpg', 'DSAN033');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `LoaiDacSan`
--

CREATE TABLE `LoaiDacSan` (
  `IDLoaiDS` char(7) NOT NULL,
  `TenLoaiDS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `LoaiDacSan`
--

INSERT INTO `LoaiDacSan` (`IDLoaiDS`, `TenLoaiDS`) VALUES
('LOAI001', 'Món chính'),
('LOAI002', 'Đồ Uống'),
('LOAI003', 'Bánh kẹo'),
('LOAI004', 'Trái Cây');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `NoiBan`
--

CREATE TABLE `NoiBan` (
  `IDNoiBan` char(7) NOT NULL,
  `TenQuan` varchar(70) DEFAULT NULL,
  `DiaChi` varchar(100) DEFAULT NULL,
  `LinkAnh` varchar(400) DEFAULT NULL,
  `TrangThai` bit(1) DEFAULT NULL,
  `IDDacSan` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `NoiBan`
--

INSERT INTO `NoiBan` (`IDNoiBan`, `TenQuan`, `DiaChi`, `LinkAnh`, `TrangThai`, `IDDacSan`) VALUES
('NB00001', 'Bản Lác Mai Châu', 'Khu Bản Lác, Mai Châu, Hòa Bình', 'https://cdn3.ivivu.com/2022/10/Mai-Ch%C3%A2u-ivivu-6-b%E1%BA%A3n-L%C3%A1c.jpg', NULL, 'DSAN001'),
('NB00002', 'Bản Pom Coọng', 'Bản Pom Coọng, Mai Châu, Hòa Bình', 'https://pttravel.vn/wp-content/uploads/2023/12/ban-pom-coong-mai-chau.jpg', NULL, 'DSAN001'),
('NB00003', 'Nhà vườn Cam Cao Phong', 'Xóm Chiềng, Cao Phong, Hòa Bình', 'https://congviendisan.vn/sites/default/files/img-1769-9806-1610588287_1200x0.jpg', NULL, 'DSAN002'),
('NB00004', 'HTX 3T nông sản Cao Phong', 'Khu 1, Cao Phong, Hòa Bình', 'https://www.hoabinh.gov.vn/documents/37326/986629/10_Nov_2023_014820_GMTz4863756929150_f4c091e650297f5df550a374396366fa.jpg', NULL, 'DSAN002'),
('NB00005', 'Cửa hàng bán và giới thiệu sản phẩm sữa Mộc Châu MILK', 'Số 4 Đường Tây Tiến , Tiểu Khu 12, Thị Trấn Nông Trường Mộc Châu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWg_ZEKXepQaKSU36qtg0DaHQrtiuCc5nK0CX4-8N2Gg&s', NULL, 'DSAN003'),
('NB00006', 'Quầy giới thiệu sản phẩm chè, bánh, sữa Mộc châu', '168 Lê Thanh Nghị, Phiêng Luông, Mộc Châu, Sơn La', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh-3Oo-I2Ma7PAswd5s7MzzLal-GwMk59F5Wk_CDaHMg&s', NULL, 'DSAN003'),
('NB00007', 'HTX Nông nghiệp Xuân Tiến', 'Sập Vạt, Yên Châu, Sơn La', 'https://danviet.mediacdn.vn/296231569849192448/2022/12/18/base64-1671341037235276381507.png', NULL, 'DSAN004'),
('NB00008', 'HTX Dịch vụ nông nghiệp Hoa Mười', 'Chiềng Khoong, Sông Mã, Sơn La', 'https://danviet.mediacdn.vn/296231569849192448/2023/7/20/thay-doi-nhan-thuc-nong-dan-thong-qua-cac-mo-hinh-san-xuat-nong-nghiep-4-1689836946802340733257.jpeg', NULL, 'DSAN004'),
('NB00009', 'Trâu gác bếp Hải Tần', 'Số 6 Trần Đăng Ninh, Mường Thanh, TP Điện Biên Phủ, Điện Biên', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi1hHZ7FcFKjD4XPNknoNm3bOu_0sWCj1ZFKzSG50b5g&s', NULL, 'DSAN005'),
('NB00010', 'Thương hiệu Bà Bích', 'Số 6, Tổ 4, Thanh Bình, Thành phố Điện Biên, Điện Biên', 'https://tourdanangcity.vn/wp-content/uploads/2023/06/thit-trau-gac-bep-dien-bien-10.jpg', NULL, 'DSAN005'),
('NB00011', 'Đặc sản Tây Bắc Showroom', 'Số 679 đường Võ Nguyên Giáp, TP. Điện Biên Phủ', 'https://noithatmasta.com/uploaded/2021/04/1/thiet-ke-cua-hang-thuc-pham-hvafood-2.jpg', NULL, 'DSAN006'),
('NB00012', 'Bản làng Sin Suối Hồ', 'xã Sin Suối Hồ, huyện Phong Thổ, Lai Châu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB-7CPUjyLIrINdbNXtzZMX0L8rhUEAM9XVLSXkmduGA&s', NULL, 'DSAN007'),
('NB00013', 'Bản làng Sìn Hồ', 'Thị trấn Sìn Hồ, huyện lỵ của huyện Sìn Hồ, tỉnh Lai Châu', 'https://cdn.tgdd.vn/Files/2023/03/21/1519523/kham-pha-du-lich-tam-duong-lai-chau-voi-6-dia-diem-cuc-dep-202303221047074650.jpg', NULL, 'DSAN007'),
('NB00014', 'Mộc quán', 'Đường 58, thị xã Lai Châu, Lai Châu', 'https://images.foody.vn/res/g8/72720/s180x180/foody-moc-quan-duong-58-733-636017067117426932.jpg', NULL, 'DSAN008'),
('NB00015', 'Nhà hàng Sen Hồng', 'Số 06, đại lộ Lê Lợi, phường Tân Phong, Lai Châu', 'https://dulich.laichau.gov.vn/DataFiles/2021/04/Photos/20210401-233744-V1pQEaNF.jpg', NULL, 'DSAN008'),
('NB00016', 'Tây Bắc Restaurant', 'Tổ 6 Hoàng Quốc Việt, Phường, Thành phố Yên Bái, Yên Bái', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3q9xZBaC6QZcP0JOr60yPWFWw32nSu92-6qtqOQ7p5w&s', NULL, 'DSAN009'),
('NB00017', 'Nhà hàng Việt Hoa', 'Tổ 4, Phường, Thành phố Yên Bái, Yên Bái', 'https://mia.vn/media/uploads/blog-du-lich/nha-hang-viet-hoa-yen-bai-am-thuc-dong-que-thanh-binh-13-1646126209.jpg', NULL, 'DSAN009'),
('NB00018', 'Mật ong, phấn hoa Hoàng Lâm', 'QL32, Sơn Thịnh, Văn Chấn, Yên Bái', 'https://product.hstatic.net/200000512379/product/0c6c2adffcd33c8d65c2_46d2cd42edb341029decaa5b9e1e1747_master.jpg', NULL, 'DSAN010'),
('NB00019', 'Mật ong Phùng Tuyết', 'Sơn Thịnh, Văn Chấn, Yên Bái', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxOJGRcXWiJkOkAiVYgWFTkYl_PRtLyfTztQ&s', NULL, 'DSAN010'),
('NB00020', 'Chợ phường Hùng Vương Phú Thọ', 'Thị Trấn Phú Thọ, Phú Thọ', 'https://file4.batdongsan.com.vn/resize/745x510/2020/08/22/20200822161118-0901_wm.jpg', NULL, 'DSAN011'),
('NB00021', 'Làng Đại Minh', 'Huyện Yên Bình, Tỉnh Yên Bái', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCEpBLFD8ogZQCGU9KGN1Ooprl6V8N40IWDW4Z6y5wjg&s', NULL, 'DSAN012'),
('NB00022', 'Quán A Phủ', '15 Fansipan, Sapa, Lào Cai', 'https://hoangviettravel.vn/wp-content/uploads/2020/03/Kham-pha-ngay-top-15-quan-an-ngon-Sapa-khien-du-khach-me-A-Phu-met.jpg', NULL, 'DSAN013'),
('NB00023', 'Phương Ngoan', '13C Nguyễn Huệ, Sapa, Lào Cai', 'https://hoangviettravel.vn/wp-content/uploads/2020/03/khu-am-thuc-sapa-1-1024x591.jpg', NULL, 'DSAN013'),
('NB00024', 'Nhà hàng cá hồi Sapa Xuân Viên', '08 phố Xuân Viên, Thị trấn Sapa', 'https://mia.vn/media/uploads/blog-du-lich/top-10-quan-ca-hoi-sapa-dac-san-doc-dao-ma-ban-nhat-dinh-dung-bo-qua-1-1620835337.jpg', NULL, 'DSAN014'),
('NB00025', 'Nhà hàng Song Nhi – Thiên đường', 'tổ 2, phường Ô Quý Hồ, thị xã Sapa, Lào Cai', 'https://mia.vn/media/uploads/blog-du-lich/top-10-quan-ca-hoi-sapa-dac-san-doc-dao-ma-ban-nhat-dinh-dung-bo-qua-21-1620835338.jpg', NULL, 'DSAN014'),
('NB00026', 'Quán A Quỳnh', '15 phố Thạch Sơn, Sapa, Lào Cai', 'https://mia.vn/media/uploads/blog-du-lich/top-10-quan-ca-hoi-sapa-dac-san-doc-dao-ma-ban-nhat-dinh-dung-bo-qua-71-1620837705.jpg', NULL, 'DSAN014'),
('NB00027', 'Tiểu Long Food', 'Số 468 Tổ Vĩnh Giang, thị trấn Vĩnh Lộc, Chiêm Hóa, Tuyên Quang', 'https://m.baotuyenquang.com.vn/media/images/2023/08/banh-gai-chiem-hoa-1.jpg', NULL, 'DSAN015'),
('NB00028', 'Thị trấn Vĩnh Lộc', 'thị trấn Vĩnh Lộc, Chiêm Hóa, Tuyên Quang', 'https://m.chiemhoa.gov.vn/media/images/2017/01/thi-tran-Vinh-Loc(1).jpg', NULL, 'DSAN015'),
('NB00029', 'Huyện Na Hang', 'huyện Na Hang tỉnh Tuyên Quang', 'https://lh4.googleusercontent.com/proxy/tGjxBf51Zb09lFFVnC4TeM6k3Mi7pFuSBh1-ui44x2b7ezRTrvfLOXUcJRXzJmyu8aWf5T0PGI-aWPjQV4q5bl7XP6Okp35UOEIT_LFTMW_Rd0jGsU5S6zhuvJ_-DZF55jcv5iTwQm5pTFcgNV3lnYItZ8enkQasK8gN226i', NULL, 'DSAN016'),
('NB00030', 'Thắng Dền Bà Béo.', '154 Trần Hưng Đạo, Nguyễn Trãi, Thành Phố Hà Giang, Hà Giang', 'https://images.baodantoc.vn/uploads/2021/Th%C3%A1ng_11/Ng%C3%A0y_18/NG%C3%82N/h2.jpg', NULL, 'DSAN017'),
('NB00031', 'Chợ tình Khâu Vai – huyện Mèo Vạc', 'ĐT 217, Khâu Vai, Mèo Vạc, Hà Giang', 'https://www.vietnambooking.com/wp-content/uploads/2018/02/du-lich-ha-giang-1-2-2018-550x355.jpg', NULL, 'DSAN017'),
('NB00032', 'Quán phở chua gia truyền Hiền Lương', '12 Bạch Đằng, Thành Phố Hà Giang, Hà Giang', 'https://hotel84.com/hotel84-images/news/img1/quan-pho-chua-hien-luong.jpg', NULL, 'DSAN018'),
('NB00033', 'Quán Ly Dính', '543 Nguyễn Trãi, Thành Phố Hà Giang, Hà Giang', 'https://cungdi.net/uploads/travel/hagiang/pho-chua-mon-ngon-ha-giang-taxisanbayre-02.jpg', NULL, 'DSAN018'),
('NB00034', 'Chợ phiên Đồng Văn', 'Thị trấn Đồng Văn – Hà Giang', 'https://hoangviettravel.vn/wp-content/uploads/2020/11/pho-chua-ha-giang.jpg', NULL, 'DSAN018'),
('NB00035', 'Chợ phiên Khang Ninh', 'xã Khang Ninh, Ba Bể, Bắc Kạn', 'https://media.baoquangninh.vn/dataimages/202101/original/images1465583_meovac2.jpg', NULL, 'DSAN019'),
('NB00036', 'Chợ Bắc Kạn', 'Đường Thành Công, Phùng Chí Kiên, TP. Bắc Kạn', 'https://lh5.googleusercontent.com/proxy/RJpo_S4JfPWnWyZe-U826DgD12LYNX-gHaigGEQbrTkt6nt1kUbCK8kTMEhFU4xnTur4ZGdNfFyOHgizt1EHLmxi-q8m25M', NULL, 'DSAN020'),
('NB00037', 'HTX chè Thanh Lương', 'Gốc mít, Xã Tân Thái, Huyện Đại Từ, Thái Nguyên.', 'https://trathainguyen.net.vn/files/assets/tra_thai_nguyen_1024x700.jpg', NULL, 'DSAN021'),
('NB00038', 'Hợp tác xã trà xanh Thái Nguyên', 'SN38, Ngõ 288 Đường CMT8, Tổ 21, Phường Phan Đình Phùng, TP Thái Nguyên', 'https://trathainguyen.net.vn/files/assets/tr_tn_cng_thi_nguyn_2.jpg', NULL, 'DSAN021'),
('NB00039', 'Cơm lam Hoà Thuận', 'Cơm Lam Định Hóa, TT. Chợ Chu, Huyện Định Hóa, Thái Nguyên.', 'https://lh5.googleusercontent.com/p/AF1QipOAUPWGXfy7lSqWYCA_zmN3_XX58BXObHI3A5BC=w408-h306-k-no', NULL, 'DSAN022'),
('NB00040', 'Cơm Lam Mười Châm', '2VR2+X98, Thái Nguyên - Bắc Kạn, Hòa Mục, Chợ Mới, Bắc Kạn, Việt Nam', 'https://lh5.googleusercontent.com/p/AF1QipOslYpxiIBElddGngrAoqRxau0s-Iv1lXnjPDIZ=w408-h725-k-no', NULL, 'DSAN022'),
('NB00041', 'Lạp sườn Thanh Lịch', 'Vườn Cam, P. Hợp Giang, Cao Bằng', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb2B3Mt2EyQ9F9fFSxNOIZ-YlMMkR_-g4LZ_k29Xsr7w&s', NULL, 'DSAN023'),
('NB00042', 'HTX Cao Bằng', '134, vườn Cam, Hợp Giang, tỉnh Cao Bằng', 'https://i.vnbusiness.vn/2019/01/24/HTX-Tan-Hoa-JPG-4452-1548344716_860x0.jpg', NULL, 'DSAN023'),
('NB00043', 'Chợ Xanh', 'Phố Cũ, Nước Giáp, tỉnh Cao Bằng', 'https://scontent.iocvnpt.com/resources/portal/Images/CBG/xuanquynhcbg/t4_2023/z4287681406493_f9c236d3c8997cff96c5cd514cb48293_127611249.jpg', NULL, 'DSAN023'),
('NB00044', 'Lạp sườn Thanh Lịch', 'Vườn Cam, P. Hợp Giang, Cao Bằng', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb2B3Mt2EyQ9F9fFSxNOIZ-YlMMkR_-g4LZ_k29Xsr7w&s', NULL, 'DSAN024'),
('NB00045', 'HTX Cao Bằng', '134, vườn Cam, Hợp Giang, tỉnh Cao Bằng', 'https://i.vnbusiness.vn/2019/01/24/HTX-Tan-Hoa-JPG-4452-1548344716_860x0.jpg', NULL, 'DSAN024'),
('NB00046', 'Nem nướng Hữu Lũng', 'Ngọc Thành, xã Đồng Tâm, huyện Hữu Lũng, Lạng Sơn', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy7wpdKsAAX-Vl5JdtHJBJ_R7SZirPUeeKdAnJN1x0Yg&s', NULL, 'DSAN025'),
('NB00047', 'Cửa hàng nem Bà Láng', 'Số 16, đường Quang Trung, TP. Lạng Sơn', 'https://i.vnbusiness.vn/2019/01/24/HTX-Tan-Hoa-JPG-4452-1548344716_860x0.jpg', NULL, 'DSAN025'),
('NB00048', 'Chợ Đông Kinh', 'Phai Vệ, Vĩnh Trại, Thành phố Lạng Sơn, Lạng Sơn', 'https://statics.vinpearl.com/cho-dong-kinh-lang-son-2_1624617401.jpg', NULL, 'DSAN026'),
('NB00049', 'Chợ Tân Thanh Lạng Sơn', 'bản Nà Lầu, xã Tân Thanh, huyện Văn Lãng, Lạng Sơn', 'https://statics.vinpearl.com/cho-tan-thanh-lang-son-1_1631787321.png', NULL, 'DSAN026'),
('NB00050', 'Vải thiều lục ngạn Hiếu Yến', 'Phượng Sơn, Lục Ngạn, Bắc Giang', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAkn9CTO7e6REsztildy3lT-SrNdaCEwMgGEK-hxLw8g&s', NULL, 'DSAN027'),
('NB00051', 'Vải Thiều Lục Ngạn', 'Nghĩa Hồ, Lục Ngạn, Bắc Giang, Bắc Giang', 'https://tinbds.com/images/place/0/sro.jpg', NULL, 'DSAN027'),
('NB00052', 'Làng Thổ Hà', 'Xã Vân Hà huyện Việt Yên tỉnh Bắc Giang', 'https://bavuiuytin.com/images/upload/images/images%20(1).jpg', NULL, 'DSAN028'),
('NB00053', 'Phở Gia Truyền', '49 Bát Đàn, Q.Hoàn Kiếm', 'https://mia.vn/media/uploads/blog-du-lich/Pho-bat-dan-pho-gia-truyen-100-nam-tuoi-tai-ha-noi-01-1639325605.jpg', NULL, 'DSAN029'),
('NB00054', 'Phở Thìn', '13 Lò Đúc, Q.Hai Bà Trưng', 'https://static-images.vnncdn.net/files/publish/2023/3/2/tdn-5230-608.jpg', NULL, 'DSAN029'),
('NB00055', 'Phở Vui', '25 Hàng Giấy, Q.Hoàn Kiếm', 'https://fastly.4sqi.net/img/general/600x600/10819764_zxdHUPC5cHHTLZe2c2Ax1xQBHzHPqVsTh3kXrWknFkk.jpg', NULL, 'DSAN029'),
('NB00056', 'Bún thang Cầu Gỗ', '48 Cầu Gỗ, Q.Hoàn Kiếm, Hà Nội', 'https://images.foody.vn/res/g2/16256/s800/foody-ba-duc-banh-cuon-nong-bun-thang-698-637421439973072779.jpg', NULL, 'DSAN030'),
('NB00057', 'Bún thang Hàng Hòm', 'số 2 ngõ Hàng Chỉ, Hàng Hòm, Q.Hoàn Kiếm, Hà Nội', 'https://tripzone.vn/uploads/202101/04/27/110638-fb-duc-duc.jpg', NULL, 'DSAN030'),
('NB00058', 'Bún thang Hàng Hành', '29 Hàng Hành, Hoàn Kiếm, Hà Nội', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrdisQsjarDzwxQQRipi0qWxUeLV4RONk9ylB6Q4RZjQ&s', NULL, 'DSAN030'),
('NB00059', 'Số 6, Phùng Hưng', 'Số 6, Phùng Hưng, Quận Hoàn Kiếm, Hà Nội', 'https://hotel84.com/hotel84-images/news/img1/quan-oc-gao-sai-gon.jpg', NULL, 'DSAN031'),
('NB00060', 'Ngõ Trung Yên', 'Số 1, Ngõ Trung Yên, Hàng Bạc, Thành phố Hoàn Kiếm, Hà Nội', 'https://media-cdn.tripadvisor.com/media/photo-s/19/0b/48/4e/img-20190824-200713-largejpg.jpg', NULL, 'DSAN031'),
('NB00061', 'Bún chả Cửa Đông', '41 Cửa Đông, Q.Hoàn Kiếm', 'https://images.foody.vn/res/g21/206880/s214x214/foody-bun-cha-nem-cua-dong-529-637123909962960607.jpg', NULL, 'DSAN032'),
('NB00062', 'Bún chả Đắc Kim', '1 Hàng Mành, Q.Hoàn Kiếm', 'https://hotel84.com/hotel84-images/news/img1/quan-bun-cha-so-1-hang-manh.jpg', NULL, 'DSAN032'),
('NB00063', 'Bún chả Sinh Từ', '57 Nguyễn Khuyến, Q.Đống Đa', 'https://bunchasinhtu.vn/wp-content/uploads/2021/06/z2168725032909_653315944e6c24afb0e0024de696bff6-1024x768.jpg', NULL, 'DSAN032'),
('NB00064', 'Bún đậu mắm tôm Ngõ Trạm', '1B Ngõ Trạm, Q.Hoàn Kiếm', 'https://static.riviu.co/320/image/2020/08/30/01db2891bbc06ec255252da64765d9c1.jpeg', NULL, 'DSAN033'),
('NB00065', 'Bún đậu Trung Hương', '49 ngõ Phất Lộc, Hàng Bạc', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsCOjyXyRZVahs2JXt3ZCSgL80JuIgG06lIIGNa2YbiA&s', NULL, 'DSAN033'),
('NB00066', 'Bún đậu Cây Bàng – Đại La', '129 Đại La, Q.Hai Bà Trưng', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIhoUiLDJYapblCpQUblLuTEyagrjNKUrEQ-PLBhadYg&s', NULL, 'DSAN033'),
('NB00067', 'Cá Thính Lan Anh', 'Xuân Lôi, Lập Thạch, Vĩnh Phúc', 'https://images.toplist.vn/images/800px/ca-thinh-lan-anh-1265675.jpg', NULL, 'DSAN034'),
('NB00068', 'Cá Thính Đỗ Hải', 'Thôn Đình, xã Tiên Lữ, huyện Lập Thạch, Vĩnh Phúc', 'https://images.toplist.vn/images/800px/co-so-san-xuat-va-kinh-doanh-ca-thinh-do-hai-471113.jpg', NULL, 'DSAN034'),
('NB00069', 'Cá thính Giang Nam', 'Lập Thạch, Vĩnh Phúc', 'https://images.toplist.vn/images/800px/co-so-san-xuat-dac-san-ca-thinh-giang-nam-471117.jpg', NULL, 'DSAN034'),
('NB00070', 'Huyên Tam Dương', 'Tam Dương, Vĩnh phúc', 'https://www.baoxaydung.com.vn/stores/news_dataimages/vananh/062018/04/22/222830baoxaydung_image001.jpg', NULL, 'DSAN035'),
('NB00071', 'Bánh phu thê Minh Thu', 'Số 6, Phố Thượng, Đình Bảng, Từ Sơn, Bắc Ninh. (Đối diện đền Đô)', 'https://ocopvietnam.vn/wp-content/uploads/2022/12/Banh-phu-the-minh-thu-ocopvietnam-1.jpg', NULL, 'DSAN036'),
('NB00072', 'Bà Liễn', 'Số 31, Ngõ 122, Phố Hạ, P. Đình Bảng,  Thị Xã Từ Sơn, Bắc Ninh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWT81dfjygpwvJ4JNtT2gOdEoBTKWx364vCxgQJKdcIw&s', NULL, 'DSAN036'),
('NB00073', 'Làng Diềm', 'hôn Viêm Xá, xã Hoà Long, huyện Yên Phong, tỉnh Bắc Ninh', 'https://lh3.googleusercontent.com/proxy/yJ9m0V39wbAtKCRQjq0CXC-sPn6DLl7WqRjqpYXn7d4gQglLd_GS1sL136-QQTbzhcurrN9NjQ2eemHqqv3CBCH9J9cD5bQaRzHWheJt-yIMuO4idqsR-cnVgeY', NULL, 'DSAN037'),
('NB00074', 'Bánh đậu xanh Nguyên Hương', '68 Trần Hưng Đạo, P. Trần Hưng Đạo, Thành phố Hải Dương, Hải Dương', 'https://vn-test-11.slatic.net/p/3f2bf3a490b3030fe3ee0da4b4dac086.jpg', NULL, 'DSAN038'),
('NB00075', 'Bánh đậu xanh Rồng Vàng Minh Ngọc', 'P. Cẩm Thượng, Thành phố Hải Dương, Hải Dương', 'https://sieuthihanoicongquynh.com/public/upload/ckeditor/107742643_910197579455274_3103170868039748168_n.jpg', NULL, 'DSAN038'),
('NB00076', 'Bánh đậu xanh Hòa An', 'P. Cẩm Thượng, Thành phố Hải Dương, Hải Dương', 'https://dacsanthanhphuong.vn/wp-content/uploads/2022/12/banh-dau-xanh-hoa-an-9.jpeg', NULL, 'DSAN038'),
('NB00077', 'Khu di tích An Phụ- Kính Chủ - Nhẫm Dương', 'phường An Sinh, thị xã Kinh Môn, tỉnh Hải Dương, Việt Nam', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_V5t8ZMgc1w4N_m05GuW5CReyxuhtuCOJqkg8QUsCpA&s', NULL, 'DSAN039'),
('NB00078', 'thôn Tiểu Quan', 'Thôn Tiểu Quang, Xã Phùng Hưng, Khoái Châu, Hưng Yên.', 'https://photos.wikimapia.org/p/00/06/49/34/88_full.jpg', NULL, 'DSAN040'),
('NB00079', 'Cửa hàng Hường Đạt', 'số 19 Quốc lộ 5, thị trấn Bần, Hưng Yên', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOLGd0Ys0DuT9rxHcDJQjZZQnWIYNjTHIRrIW8isH7BQ&s', NULL, 'DSAN041'),
('NB00080', 'Cửa hàng Thanh Lan', 'số 25, thị trấn Bần, Hưng Yên', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK6ovgjTf8MqT8ZJyGLOG8x0Rxu7CDQV0Rkg&s', NULL, 'DSAN041'),
('NB00081', 'Xà Lạc Đạo', 'Lạc Đạo, Văn Lâm, Hưng Yên', 'https://tinbds.com/images/place/0/hqq.jpg', NULL, 'DSAN042'),
('NB00082', 'Bánh giò Bến Hiệp', 'Bến Hiệp, Xã Quỳnh Giao, Huyện Quỳnh Phụ, Thái Bình', 'https://cdn.alongwalk.info/vn/wp-content/uploads/2022/05/13202416/image-banh-gio-ben-hiep-dac-san-thon-que-thai-binh-165242305698439.jpg', NULL, 'DSAN043'),
('NB00083', 'Nhà hàng Sen Đồng', '35 Lương Văn Can, phường Lam Sơn, Hưng Yên', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUA_u2JAnT7vQCTa_ZkxnuD5qjnJZ8hYrbrWKabBqTJg&s', NULL, 'DSAN044'),
('NB00084', 'Cơ sở kho cá của công ty DASAVINA', 'óm 13, xãHòa Hậu, huyện Lý Nhân, tỉnh Hà Nam', 'https://dasavina.com.vn/wp-content/uploads/2023/05/ca-kho-ba-kien.jpeg', NULL, 'DSAN045'),
('NB00085', 'Cửa hàng ở Hà Nội', 'Số 18, lô 4B, đường Trung Yên 10A, phường Yên Hòa, Cầu Giấy, Hà Nội', 'https://cdn.alongwalk.info/vn/wp-content/uploads/2022/03/11021020/image-top-10-quan-an-dac-san-dan-toc-ngon-nhat-tai-ha-noi-164691421983749.jpg', NULL, 'DSAN045'),
('NB00086', 'Bánh cuốn chả Linh Chi', 'Số 5 Trần Phú, Phủ Lý, Hà Nam', 'https://images.foody.vn/res/g26/250208/prof/s/foody-mobile-foody-banh-cuon-cha--655-636027109024932364.jpg', NULL, 'DSAN046'),
('NB00087', 'Bánh cuốn chả Hương Định', '120B Quy Lưu, Phủ Lý, Hà Nam', 'https://images.foody.vn/res/g27/260625/prof/s640x400/foody-mobile-banh-cuon-cha-phu-ly-536-636052093468525210.jpg', NULL, 'DSAN046'),
('NB00088', 'Bánh cuốn chả, bún chả Thái Thắng', '273 Lý Thường Kiệt, phường Lê Hồng Phong, Phủ Lý, Hà Nam', 'https://images.foody.vn/res/g88/870089/prof/s/foody-upload-api-foody-mobile-1-jpg-181226151551.jpg', NULL, 'DSAN046'),
('NB00089', 'Cơm Cháy Trường An', 'xóm Đình, Hoa Lư, Ninh Bình, Ninh Bình', 'https://disaigon.com/wp-content/uploads/2024/03/Com-chay-Truong-An.jpg', NULL, 'DSAN047'),
('NB00090', 'Cơm cháy Cố Đô', 'Thôn Hội Tiến, xã Quỳnh Lưu, huyện Nho Quan, tỉnh Ninh Bình', 'https://dulichkhampha24.com/wp-content/uploads/2021/06/san-pham-com-chay-co-do.jpeg', NULL, 'DSAN047'),
('NB00091', 'Cơm cháy Ninh Bình Đại Long', '519 Trần Hưng Đạo, Ninh Khánh, Ninh Bình', 'https://i0.wp.com/dailongjsc.com.vn/wp-content/uploads/2021/03/com-chay-cochi-cha-bong-65-g.jpg', NULL, 'DSAN047'),
('NB00092', 'Quán Ba Cửa', 'Thôn Tràng An,Trường Yên, Hoa Lư, Ninh Bình', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxpYWv23U0gk25KtvUeRX368ZZnyu5dtH2ZEN6N4MNGA&s', NULL, 'DSAN048'),
('NB00093', 'Quán Cường Dê', 'Trường Yên, Hoa Lư, Ninh Bình', 'https://hotel84.com/hotel84-images/news/img1/nha-hang-cuong-de-nb.jpg', NULL, 'DSAN048'),
('NB00094', 'Quán Chính Thư', 'Thôn Khê Thượng, Ninh Xuân, Hoa Lư, Tỉnh Ninh Bình', 'https://hotel84.com/hotel84-images/news/img1/bien-nha-hang-de-chinh-thu.jpg', NULL, 'DSAN048'),
('NB00095', 'Ngã tư Hoàng Văn Thụ – Lê Hồng Phong', 'Ngã tư Lê Hồng Phong – Hoàng Văn Thụ, Tp. Nam Định', 'https://mia.vn/media/uploads/blog-du-lich/banh-xiu-pao-06-1699280180.jpg', NULL, 'DSAN049'),
('NB00096', 'Bánh phố Hàng Sắt', 'Phố Hàng Sắt, Phường Nguyễn Du, Tp. Nam Định', 'https://photo-cms-baophapluat.epicdn.me/w1000/Uploaded/2024/zsgkqzektazs/2022_01_12/tiem-banh-6604.jpg', NULL, 'DSAN049'),
('NB00097', 'Bánh Nhãn Hải Hậu', 'Xóm Phạm Giảng – Hải Tân – Hải Hậu – Nam Định', 'https://banhnhanhaihau.com/wp-content/uploads/2020/12/banh-nhan-hai-hau-nam-dinh.jpg', NULL, 'DSAN050'),
('NB00098', 'Bánh nhãn Lưu Tuệ', '83 Đông Biên, TT. Yên Định, Hải Hậu, Nam Định', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ5uwdShDEwJSNVOUyJ3TmuPlLRL_JsQ3KAveqcJ54GA&s', NULL, 'DSAN050'),
('NB00099', 'Quán 48 Lạch Tray', '48 Lạch Tray, P. Lạch Tray , Quận Ngô Quyền , Hải Phòng', 'https://hotel84.com/userfiles/image/nhahang/HaiPhong/banhdacua48lachtray/quan-banh-da-cua-48-lach-tr.jpg', NULL, 'DSAN051'),
('NB00100', 'Bánh đa cua Huyền Trang', '139 Thiên Lôi, Vĩnh Niệm, Lê Chân, Hải Phòng', 'https://media.mia.vn/uploads/blog-du-lich/top-quan-banh-da-cua-hai-phong-noi-tieng-khap-dat-cang-1647010422.jpg', NULL, 'DSAN051'),
('NB00101', 'Quán bánh đa cua 26 Kỳ Đồng', '26 Kỳ Đồng, Quang Trung, Hồng Bàng, Hải Phòng', 'https://toplist.bcmar.com/wp-content/uploads/2022/04/24440652_DNR7whWY3YjaNxH8gQlRRuit2wC1xgtRbAmJGODCuBk.jpg', NULL, 'DSAN051'),
('NB00102', 'Cửa hàng bún chả Phương Mai', '87 Cát Cụt, An Biên, Lê Chân, Hải Phòng', 'https://nhahangchanemcuabephuongmai.com/media/sfqhbvjv/nh%C3%A0-h%C3%A0ng.jpg', NULL, 'DSAN052'),
('NB00103', 'Quán Nga', '92 Trần Nhật Duật, Cầu Đất, Ngô Quyền, Hải Phòng', 'https://fastly.4sqi.net/img/general/600x600/568123217_p5MKRxFlohC_YZgrdSx8JH2rMEr8E_pmzX5dGD06UD4.jpg', NULL, 'DSAN052'),
('NB00104', 'Quán Ngõ 195 Cầu Đất', '195 Cầu Đất, Lê Lợi, Ngô Quyền, Hải Phòng', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCcS8k8GVrOIzKB6Rxx2XQpJ_iUXkaRDIo7KjcDiE4FA&s', NULL, 'DSAN052'),
('NB00105', 'Chả mực Dasavina', 'Ki ốt số 46 – 47, chợ Hạ Long 1, thành phố Hạ Long', 'https://chamuchalong.org/wp-content/uploads/2021/06/cha-muc-tien-vua-dasavina.jpg', NULL, 'DSAN053'),
('NB00106', 'Chả mực Thoan', 'Ki ốt 36 – 37, chợ Hạ Long 1, thành phố Hạ Long', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0VDoLhnKq5aeimqDOyTqtLbjO5l7uowIR7w6gAzELSQ&s', NULL, 'DSAN053'),
('NB00107', 'Chả mực Hoài Phương', 'số 46 – 47 chợ Hạ Long 1, thành phố Hạ Long', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxbZeHA7Gs96gb-LWfyE69vYfjXcbkpdyFBn0ZLw8Rvw&s', NULL, 'DSAN053'),
('NB00108', 'Hợp tác xã Chăn nuôi gà Tiên Yên', 'Thôn Tềnh Bô, Phong Dụ, Tiên Yên, Quảng Ninh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfG5a8bT-Yq4X0vDKKKCLxNauUaMBe85gYMXd1H8ASSQ&s', NULL, 'DSAN054'),
('NB00109', 'Gà Tiên Yên Đệ Nhất', 'B106 - Phố Cổ, Đường Hạ Long, Phường Bãi Cháy, Hạ Long, Quảng Ninh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8tWz5KSvEtY_K927W4xwx_l0Q5X1i1NLsSpNqwmMHag&s', NULL, 'DSAN054'),
('NB00110', 'Nhà hàng Hà Tiên', 'Lý Thường Kiệt, thị trấn Tiên Yên, Tiên Yên, Quảng Ninh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmiBIcWB3SpBeDAah2aPOxdBrdLMULz7-A-HQmXgxEjQ&s', NULL, 'DSAN054'),
('NB00111', 'Bánh cuốn nóng Thanh Hóa bà Lành', '252 Tống Duy Tân, P. Lam Sơn, Tp. Thanh Hóa, Thanh Hóa', 'https://statics.vinpearl.com/banh-cuon-thanh-hoa-3-_1629698200.png', NULL, 'DSAN055'),
('NB00112', 'Bánh cuốn xứ Thanh Nguyễn Chích', '19 Nguyễn Chích, Tp. Thanh Hóa, Thanh Hóa', 'https://statics.vinpearl.com/banh-cuon-thanh-hoa-8_1629691604.png', NULL, 'DSAN055'),
('NB00113', 'Bưởi tiến vua Luận Văn', 'làng luận văn , xã thọ xương, thọ xuân, thanh hoá, Thanh Hóa, Vietnam', 'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/302425889_533696442093096_1161024451681296017_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=PKakU-X2s9wAb6Xe-Sn&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfCp97kMtAjAclFVokrpqHKQCssoVlP5mErRvHvJD96nyg&oe=6617582C', NULL, 'DSAN056'),
('NB00114', 'Làng Mía', 'Làng Mía, xã Thọ Diên, huyện Thọ Xuân, tỉnh Thanh Hoá, Thanh Hóa, Vietnam', 'https://scontent.fsgn17-1.fna.fbcdn.net/v/t39.30808-6/292167081_398635175632855_2636678678776408255_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_ohc=jlJfReXFlZgAb7gDXa7&_nc_ht=scontent.fsgn17-1.fna&oh=00_AfAw7xAVf-gqtrIbFnBBb9uDn5V95YgN37-vc9wEyDO2jQ&oe=66172C96', NULL, 'DSAN057'),
('NB00115', 'Quán Bà Liễu', '87 Mai Hắc Đế , Quán Bàu, Tp Vinh', 'https://images.foody.vn/res/g4/33240/prof/s576x330/foody-mobile-chao-luon-ba-lieu-nghe-an.jpg', NULL, 'DSAN058'),
('NB00116', 'Quán cháo lươn Hồng Quang', '38 Ngô Sĩ Liên, Tp Vinh', 'https://images.foody.vn/res/g73/726838/prof/s576x330/foody-upload-api-foody-mobile-2-jpg-180326093925.jpg', NULL, 'DSAN058'),
('NB00117', 'Bánh gai xứ Dừa ( Anh Sơn – Nghệ An)', 'Tầng 1, chung cư Tân Phát – đường Lê Mao kéo dài – phường Vinh Tân, TP Vinh – Nghệ An', 'http://dacsannghetinh.com.vn/wp-content/uploads/2017/07/z2229221641713_9cc35025e456d02a83341c8d3fafb7c8-500x360.jpg', NULL, 'DSAN059'),
('NB00118', 'Lẩu cá Khoai Anh Đào', 'Số 250 Phan Bội Châu, TP. Đồng Hới, Quảng Bình', 'https://statics.vinpearl.com/l%E1%BA%A9u-c%C3%A1-khoai-qu%E1%BA%A3ng-b%C3%ACnh-6_1632805548.jpg', NULL, 'DSAN062'),
('NB00119', 'Lẩu Bình An Đồng Hới', '58 Nguyễn Du, TP. Đồng Hới, Quảng Bình', 'https://statics.vinpearl.com/lau-ca-khoai-quang-binh-5_1632813552.jpg', NULL, 'DSAN062'),
('NB00120', 'Bánh Tét Mặt Trăng', 'Đội 4, Đại An Khê, Hải Lăng, Quảng Trị, Việt Nam', 'https://cdn.tgdd.vn/Files/2022/06/21/1441330/quang-tri-co-dac-san-gi-15-dac-san-quang-tri-nen-mua-ve-lam-qua-202206211149099031.jpg', NULL, 'DSAN063'),
('NB00121', 'Đại lý bán rượu gạo Kim Long', 'Tỉnh lộ 68, Hải Quế, Hải Lăng, Quảng Trị', 'https://cdn.tgdd.vn/Files/2022/06/21/1441330/quang-tri-co-dac-san-gi-15-dac-san-quang-tri-nen-mua-ve-lam-qua-202206211151511492.jpg', NULL, 'DSAN064'),
('NB00122', 'Quán Mệ Kéo', '20 Bạch Đằng, TP Huế', 'https://images.foody.vn/res/g6/59927/s180x180/foody-ganh-bun-bo-me-keo-756-636089462374433702.jpg', NULL, 'DSAN065'),
('NB00123', 'Quán Bún Hẻm', 'Kiệt 29/1 phố Hùng Vương, Tp. Huế', 'https://1.bp.blogspot.com/-RVdzEVQiE4w/XdKkU2lJxwI/AAAAAAAAACw/4ey_frbZnMonI3iOQrmTwPEasV8uGOVLgCLcBGAsYHQ/s1600/bun-bo-hue.jpg', NULL, 'DSAN065'),
('NB00124', 'Chè Cầm', 'số 10 Nguyễn Sinh Cung, TP Huế', 'https://images.foody.vn/res/g25/247640/prof/s576x330/foody-mobile-cam-jpg-484-636044600369673585.jpg', NULL, 'DSAN066'),
('NB00125', 'Chè Trang Trang', '99 Phan Đình Phùng, TP Huế', 'https://tse2.mm.bing.net/th?id=OIP.PcuYI1ORjZ1fYNpKB1ym7AHaE_&pid=Api&P=0&h=180', NULL, 'DSAN066'),
('NB00126', 'Quán cháo canh cá lóc Dung Thanh', '301 Nguyễn Du - TP. Hà Tĩnh', 'https://statics.vinpearl.com/chao-canh-ha-tinh-5_1632661729.png', NULL, 'DSAN067'),
('NB00127', 'Quán cháo canh Kim Chi Hà Tĩnh', '17/2 Nguyễn Huy Tự - TP. Hà Tĩnh', 'https://statics.vinpearl.com/chao-canh-ha-tinh-6_1679645446.jpg', NULL, 'DSAN067'),
('NB00128', 'Chợ Hà Tĩnh', 'Chợ Hà Tĩnh, Nam Hà, Hà Tĩnh', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-ha-tinh-7.jpg', NULL, 'DSAN068'),
('NB00129', 'Mì Quảng Thanh Hà', '551 Trần Cao Vân, Phường Trường Xuân, Tam Kỳ, Quảng Nam', 'https://lh3.googleusercontent.com/p/AF1QipPmK3BdX6k3eHP1DIldNuY7sReNWRw5TXMjmEXW=s680-w680-h510', NULL, 'DSAN069'),
('NB00130', 'Mì Quảng Ông Hai', '6A Trương Minh Lượng, Cẩm Châu, Hội An, Quảng Nam', 'https://media-cdn.tripadvisor.com/media/photo-s/13/ed/ea/13/hai-restaurant-hoi-an.jpg', NULL, 'DSAN069'),
('NB00131', 'Siêu thị', 'Quảng Nam', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/R%C6%B0%E1%BB%A3u_H%E1%BB%93ng_%C4%90%C3%A0o_%E1%BB%9F_BigC_n%C4%83m_2018.jpg', NULL, 'DSAN070'),
('NB00132', 'Bánh khô mè bà Liễu Đà Nẵng', '200/1 Ông Bích Đường, Cẩm Lệ, Đà Nẵng', 'https://tourdanangcity.vn/wp-content/uploads/2020/09/banh-kho-me.jpg', NULL, 'DSAN064'),
('NB00133', 'Quán bún chả cá Bà Hoa', '27 Lê Hồng Phong, phường Phước Ninh, quận Hải Châu, TP. Đà Nẵng', 'https://2trip.vn/wp-content/uploads/2022/12/bun-cha-ca-da-nang-7.jpg', NULL, 'DSAN072'),
('NB00134', 'Quán bún chả cá Bà Lữ', '319 Hùng Vương, phường Vĩnh Trung, quận Thanh Khê, Đà Nẵng', 'https://2trip.vn/wp-content/uploads/2022/12/bun-cha-ca-da-nang-5.jpg', NULL, 'DSAN072'),
('NB00135', 'Don Gáo Dừa', 'nằm cuối đường Trường Sa, TP. Quảng Ngãi', 'https://static.vinwonders.com/production/Don-quang-ngai-4.jpg', NULL, 'DSAN073'),
('NB00136', 'Quán don Cổ Lũy 20 Trà Bồng Khởi Nghĩa', '20 Trà Bồng Khởi Nghĩa, TP. Quảng Ngãi', 'https://static.vinwonders.com/production/Don-quang-ngai-6.jpg', NULL, 'DSAN073'),
('NB00137', 'Cơ sở bánh Thùy Trang', 'Số 68 Phan Chu Trinh, huyện Nguyễn Nghiêm, tỉnh Quảng Ngãi', 'https://ik.imagekit.io/tvlk/blog/2022/07/dac-san-quang-ngai-3.jpg?tr=dpr-2,w-675', NULL, 'DSAN074'),
('NB00138', 'Bún Chả Cá Phượng Tèo', '209 - 211 Nguyễn Huệ, P. Trần Phú,  Tp. Qui Nhơn, Bình Định', 'https://images.foody.vn/res/g2/17469/prof/s576x330/foody-upload-api-foody-mobile-co-38dafd79-230817162620.jpeg', NULL, 'DSAN075'),
('NB00139', 'Quán Bún Cá Ngọc Liên – Quy Nhơn', '379 Nguyễn Huệ, Tp. Quy Nhơn, Bình Định', 'https://dulichquynhon.com/wp-content/uploads/2017/09/bun-ca-ngoc-lien.jpg', NULL, 'DSAN075'),
('NB00140', 'Bánh ít lá gai Quy Nhơn', '110 Hoàng Văn Thụ, P. Quang Trung, TP. Quy Nhơn, Bình Định', 'https://static.vinwonders.com/production/dac-san-binh-dinh-7.jpg', NULL, 'DSAN076'),
('NB00141', 'Quán bà Tám cá ngừ đại dương', 'Số 287, 289 và 293 đường Lê Duẩn, thành phố Tuy Hòa, tỉnh Phú Yên', 'https://images.foody.vn/res/g23/222653/s180x180/foody-ba-tam-ca-ngu-dai-duong-129-636503266708860136.jpg', NULL, 'DSAN077'),
('NB00142', 'Làng', 'Hoà Đa, Phú Yên', 'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_1000/v1626339421/blog/snp1a8ncr4dflseeps8i.webp', NULL, 'DSAN078'),
('NB00143', 'Bún Cá Nha Trang Hạnh Nhiên', '32C Lê Đại Hành, P. Phước Tiến, Tp. Nha Trang, Khánh Hoà', 'https://images.foody.vn/res/g65/644218/prof/s576x330/foody-mobile-hnhin-jpg-455-636338049139604342.jpg', NULL, 'DSAN079'),
('NB00144', 'Bánh Canh Hai Cá', '156 Nguyễn Thị Minh Khai, P. Tân Lập, Tp. Nha Trang, Khánh Hoà', 'https://mms.img.susercontent.com/vn-11134517-7r98o-lqvvrfgpwsd546@resize_ss120x120!@crop_w120_h120_cT', NULL, 'DSAN079'),
('NB00145', 'cửa hàng tạp hóa', 'địa bàn thành phố Nha Trang', 'https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/thanh-pham-1324.jpg', NULL, 'DSAN080'),
('NB00146', 'Bún sứa Cá Kiều', '70 Lê Lợi, Kinh Dinh, Phan Rang – Tháp Chàm, Ninh Thuận', 'https://static.vinwonders.com/production/dac-san-ninh-thuan-4.jpg', NULL, 'DSAN081'),
('NB00147', 'Vườn nho Ba Mọi', 'Thôn Hiệp Hòa, Xã Phước Thuận, Huyện Ninh Phước, Tỉnh Ninh Thuận.', 'https://r2.nucuoimekong.com/wp-content/uploads/chup-anh-vuon-nho-ninh-thuan.jpg', NULL, 'DSAN082'),
('NB00148', 'Vườn nho Tina', 'Thôn Thái An, Xã Vĩnh Hải, Huyện Ninh Hải, Tỉnh Ninh Thuận.', 'https://r2.nucuoimekong.com/wp-content/uploads/du-lich-vuon-nho-ninh-thuan.jpg', NULL, 'DSAN082'),
('NB00149', 'Làng Kon Jơ Ri', 'Làng Kon Jơ Ri, xã Đăk Rơ Wa, TP. Kon Tum', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-kon-tum-2-1024x740.jpeg?tr=dpr-2,w-675', NULL, 'DSAN083'),
('NB00150', 'Phở khô 62', 'Số 611 đường Phan Đình Phùng, phường Duy Tân, TP. Kon Tum', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-kon-tum-6-1024x597.jpeg?tr=dpr-2,w-675', NULL, 'DSAN084'),
('NB00151', 'Bánh căn Lân Nguyệt', '8 Đ.Hải Thượng Lãn Ông, Phú Trinh, Thành phố Phan Thiết, Bình Thuận', 'https://cdn.tgdd.vn/Files/2021/07/01/1364754/binh-thuan-co-dac-san-gi-15-dac-san-binh-thuan-mua-lam-qua-202206161727593810.jpg', NULL, 'DSAN085'),
('NB00152', 'Chợ Phan Thiết', '115 Lý Thường Kiệt, Đức Nghĩa, Thành phố Phan Thiết, Bình Thuận', 'https://cdn.tgdd.vn/Files/2021/07/01/1364754/10-mon-dac-san-binh-thuan-nen-mua-ve-lam-qua-202112301617233920.jpg', NULL, 'DSAN086'),
('NB00153', 'Bún cua Chi', 'số 2 Phùng Hưng, P. Hội Thương, Thành phố Pleiku, Gia Lai', 'https://hotel84.com/hotel84-images/news/photo/bun-cua-mam-thoi.jpg', NULL, 'DSAN087'),
('NB00154', 'Bún Cua - Phùng Hưng', '19 Phùng Hưng,  Thành Phố Pleiku, Gia Lai', 'https://images.foody.vn/res/g66/655885/prof/s576x330/foody-mobile-regwr4es-jpg-693-636294243299848861.jpg', NULL, 'DSAN087'),
('NB00155', 'Thu Hà Cafe', '09 Nguyễn Thái Học, P. Hội Thương, Thành phố Pleiku, Gia Lai', 'http://www.caphethuha.vn/images/banner-slide-1.png?1712423699492', NULL, 'DSAN088'),
('NB00156', 'Cà Phê Từ Tâm', '422 Cách Mạng Tháng Tám, P. Hoa Lư, Thành phố Pleiku, Gia Lais', 'https://lh5.googleusercontent.com/p/AF1QipMvMihisWT-WxHq3MeQ-aec-n8-yKjo3n3aVcuT', NULL, 'DSAN088'),
('NB00157', 'Rượu Cần Y Miên', '539 Nguyễn Văn Cừ, Tân Hoà, Buôn Ma Thuột, Đắk Lắk', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-dak-lak-4-1024x577.jpeg?tr=dpr-2,w-675', NULL, 'DSAN089'),
('NB00158', 'Nhà hàng Buôn Ma Thuột Lạ Garden', '57 Nguyễn Khuyến, Tân Lợi, TP. Buôn Ma Thuột, Đắk Lắk', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-dak-lak-6-1024x575.jpeg?tr=dpr-2,w-675', NULL, 'DSAN090'),
('NB00159', 'cà phê Đức Lập', 'Đắk Lao, Đắk Mil, Đắk Nông', 'https://www.vietnambooking.com/wp-content/uploads/2023/10/dac-san-dak-nong-2-1.jpg', NULL, 'DSAN091'),
('NB00160', 'Vườn xoài Đăk R’La', 'Số 22 thôn 4, Đắk R’La, Đắk Mil, Đắk Nông', 'https://www.vietnambooking.com/wp-content/uploads/2023/10/dac-san-dak-nong-4.jpg', NULL, 'DSAN092'),
('NB00161', 'Vườn dâu treo Biofresh', 'Khu du lịch Hồ Than Thở, đường Hồ Xuân Hương, p. 10, Tp. Đà Lạt, Lâm Đồng', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-lam-dong-4-1024x683.jpeg?tr=dpr-2,w-675', NULL, 'DSAN093'),
('NB00162', 'Vườn dâu', 'Số 35 Hồ Xuân Hương, phường 9, Tp. Đà Lạt, Lâm Đồng', 'http://media.dulich24.com.vn/bai-viet/dac-san-noi-bat-o-lam-dong-26101032/dac-san-noi-bat-o-lam-dong.jpg', NULL, 'DSAN093'),
('NB00163', 'Bánh ướt lòng gà Hằng', '68 Phan Đình Phùng, p. 4, Thành Phố Đà Lạt, Lâm Đồng', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-lam-dong-8-1024x683.jpeg?tr=dpr-2,w-675', NULL, 'DSAN094'),
('NB00164', 'Quán Trang', 'Số 15F Đường Tăng Bạt Hổ, P. 1, Thành phố Đà Lạt, Lâm Đồng', 'https://yt.cdnxbvn.com/medias/place.vn/35/35241/banh-uot-long-ga-quan-long.jpg', NULL, 'DSAN094'),
('NB00165', 'Cơm tấm Sà Bì Chưởng', '268 Đường Trần Bình Trọng, Quận 5 Ho Chi Minh', 'https://game8.vn/media/202106/images/1(5).png', NULL, 'DSAN095'),
('NB00166', 'Cơm sườn Ba Cường', '263 Trần Quang Khải, Phường Tân Định, Quận 1 Hồ Chí Minh', 'https://assets.grab.com/wp-content/uploads/sites/11/2020/02/21032212/photo10-37-e1582226542921.jpg', NULL, 'DSAN095'),
('NB00167', 'Café bệt nhà thờ Đức Bà', 'đường Hàn Thuyên, P.Bến Nghé, Q.1, TP.HCM', 'https://www.vietfuntravel.com.vn/image/data/Hinh-Sai-Gon/1040.nhung-quan-cafe-via-he-o-sai-gon/nhung-quan-cafe-via-he-o-sai-gon-h1.jpg', NULL, 'DSAN096'),
('NB00168', 'Café vợt hẻm Phan Đình Phùng', '263 Trần Quang Khải, Phường Tân Định, Quận 1 Hồ Chí Minh', 'https://www.vietfuntravel.com.vn/image/data/Hinh-Sai-Gon/1040.nhung-quan-cafe-via-he-o-sai-gon/nhung-quan-cafe-via-he-o-sai-gon-h2-gigapixel.jpg', NULL, 'DSAN096'),
('NB00169', 'Bánh mì Huỳnh Hoa', '26 Lê Thị Riêng, phường Bến Thành, quận 1, Ho Chi Minh', 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/10/Capture-40.png', NULL, 'DSAN097'),
('NB00170', 'Bánh mì bò nướng bơ Campuchia', '165 Cống Quỳnh, phường Nguyễn Cư Trinh, quận 1, Hồ Chí Minh', 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/10/Capture-41.png', NULL, 'DSAN097'),
('NB00171', 'Bột chiên ngon Thủ Đức', 'Số 146 đường Hoàng Diệu 2, P.Linh Trung, Thành phố Thủ Đức, Ho Chi Minh', 'https://vntopfood.com/wp-content/uploads/2023/10/Bot-chien-ngon-Thu-Duc-Quan-146-tren-duong-Hoang-Dieu-2-1024x577.jpg', NULL, 'DSAN098'),
('NB00172', 'Quán 96', 'Số 96 đường Chương Dương, phường Linh Chiểu, Thành phố Thủ Đức, TPHCM.', 'https://vntopfood.com/wp-content/uploads/2023/10/Quan-96-dia-diem-an-bot-chien-ngon-o-Thu-Duc.jpeg', NULL, 'DSAN098'),
('NB00173', 'Làng bưởi Năm Huệ Tân Triều', 'Số 109/7 đường Hương Lộ 9, xã Tân Bình, huyện Vĩnh Cửu, Tỉnh Đồng Nai.', 'https://ik.imagekit.io/tvlk/blog/2022/07/buoi-tan-trieu-la-dac-san-thuoc-dia-danh-nao-1.jpg', NULL, 'DSAN099'),
('NB00174', 'Làng bưởi Năm Roi', 'Số 136 đường Hương Lộ 9, xã Tân Bình, huyện Vĩnh Cửu, Tỉnh Đồng Nai.', 'https://ik.imagekit.io/tvlk/blog/2022/07/buoi-tan-trieu-la-dac-san-thuoc-dia-danh-nao-2.jpg', NULL, 'DSAN099'),
('NB00175', 'Làng bưởi Năm Huệ Tân Triều', 'Số 109/7 đường Hương Lộ 9, xã Tân Bình, huyện Vĩnh Cửu, Tỉnh Đồng Nai.', 'https://ik.imagekit.io/tvlk/blog/2022/07/buoi-tan-trieu-la-dac-san-thuoc-dia-danh-nao-1.jpg', NULL, 'DSAN100'),
('NB00176', 'Làng bưởi Năm Roi', 'Số 136 đường Hương Lộ 9, xã Tân Bình, huyện Vĩnh Cửu, Tỉnh Đồng Nai.', 'https://ik.imagekit.io/tvlk/blog/2022/07/buoi-tan-trieu-la-dac-san-thuoc-dia-danh-nao-2.jpg', NULL, 'DSAN100'),
('NB00177', 'Tân Hiệp Quán', 'Cạnh sông Đồng Nai trên đường Hàm Nghi (nay là đường Cách mạng tháng 8).', 'http://www.dulichdongnai.com.vn/UserFiles/Images/2017/05/_TVU01701.jpg', NULL, 'DSAN101'),
('NB00178', 'Gà Nướng - Xôi Chiên', 'Quốc Lộ 1A.', 'http://www.dulichdongnai.com.vn/UserFiles/Images/2017/05/_TVU01701.jpg', NULL, 'DSAN101'),
('NB00179', 'Bánh bèo bì Mỹ Liên', '1 ĐT745, An Thạnh, Thuận An, Bình Dương.', 'https://binhduongtoplist.com/wp-content/uploads/2023/11/banh-beo-bi-my-lien-binhduongtoplist.jpg', NULL, 'DSAN102'),
('NB00180', 'Bánh bèo bì Dì Tám', '737 Đại lộ Bình Dương, Chánh Mỹ, Thủ Dầu Một, Bình Dương.', 'https://binhduongtoplist.com/wp-content/uploads/2023/11/banh-beo-bi-di-tam-binhduongtoplist.jpg', NULL, 'DSAN102'),
('NB00181', 'Quán Bò nướng ngói', '1173 Huỳnh Văn Lũy, Phường Phú Mỹ, Thủ Dầu Một, Bình Dương.', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-binh-duong-5-1024x1024.jpeg', NULL, 'DSAN103'),
('NB00182', 'Khang Anh', '77 Phan Đình Giót, Phường Chánh Nghĩa, Thủ Dầu Một, Bình Dương.', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-binh-duong-5-1024x1024.jpeg', NULL, 'DSAN103'),
('NB00183', 'Xóm mứt gừng', 'Khu phố Bình Hòa, phường Bình Nhâm, thị xã Thuận An, Bình Dương.', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-binh-duong-8-1024x680.jpeg?tr=dpr-2,w-675', NULL, 'DSAN104'),
('NB00184', 'Mứt gừng truyền thống', '651 Cách Mạng Tháng 8, Thủ Dầu Một, Bình Dương.', 'https://ik.imagekit.io/tvlk/blog/2022/05/dac-san-binh-duong-8-1024x680.jpeg?tr=dpr-2,w-675', NULL, 'DSAN104'),
('NB00185', 'Bún Riêu Tôm Thuận Phúc', '94 Hoàng Hoa Thám, Phường Thắng Tam, TP. Vũng Tàu.', 'https://topbariavungtauaz.com/wp-content/uploads/2023/11/bun-hai-san-Vung-Tau_3.jpg', NULL, 'DSAN105'),
('NB00186', 'Bánh Canh Ghẹ Anh Vy', '109 Võ Thị Sáu, Phường 2, TP. Vũng Tàu.', 'https://topbariavungtauaz.com/wp-content/uploads/2023/11/bun-hai-san-Vung-Tau_8.jpg', NULL, 'DSAN105'),
('NB00187', 'Gỏi cá mai Vũng Tàu Quán Thiên Ân', '195 Võ Thị Sáu, Phường Thắng Tam, TP. Vũng Tàu.', 'https://foodi.com.vn/wp-content/uploads/2021/12/G%E1%BB%8Fi-c%C3%A1-mai-V%C5%A9ng-T%C3%A0u-1.jpg', NULL, 'DSAN106'),
('NB00188', 'Gỏi cá mai Vườn Xoài Vũng Tàu', '34/5 Hoàng Hoa Thám, TP. Vũng Tàu.', 'https://foodi.com.vn/wp-content/uploads/2021/12/G%E1%BB%8Fi-c%C3%A1-mai-V%C5%A9ng-T%C3%A0u-3.jpg', NULL, 'DSAN106'),
('NB00189', 'Cửa hàng đặc sản Bình Phước', 'Trên trục đường từ Bình Phước về Sài Gòn.', 'https://cdn.alongwalk.info/vn/wp-content/uploads/2022/11/14183633/image-thuong-thuc-com-lam-binh-phuoc-thom-ngon-deo-bui-an-mot-lan-la-nho-166840059336123.jpg', NULL, 'DSAN107'),
('NB00190', 'Quán ăn đặc sản Bình Phước', 'Trên quốc lộ 14, tỉnh Bình Phước.', 'https://cdn.alongwalk.info/vn/wp-content/uploads/2022/11/14183633/image-thuong-thuc-com-lam-binh-phuoc-thom-ngon-deo-bui-an-mot-lan-la-nho-166840059336123.jpg', NULL, 'DSAN107'),
('NB00191', 'Chợ Đồng Xoài', '11 Đường Nơ Trang Long, Tân Bình, Đồng Xoài, Bình Phước.', 'https://cdn.tgdd.vn/Files/2022/06/24/1442040/binh-phuoc-co-dac-san-gi-15-dac-san-binh-phuoc-mua-lam-qua-202206240825093456.jpg', NULL, 'DSAN108'),
('NB00192', 'Chợ Thanh Lương', 'Thanh Lương, Bình Long, Bình Phước.', 'https://cdn.tgdd.vn/Files/2022/06/24/1442040/binh-phuoc-co-dac-san-gi-15-dac-san-binh-phuoc-mua-lam-qua-202206240825093456.jpg', NULL, 'DSAN108'),
('NB00193', 'Mai Vàng', 'Mai Vàng 68 – Số 8 Nguyễn Trãi, P. Tân Thiện, Tx Đồng Xoài, Bình Phước.', 'https://cdn.alongwalk.info/vn/wp-content/uploads/2022/11/14183633/image-thuong-thuc-com-lam-binh-phuoc-thom-ngon-deo-bui-an-mot-lan-la-nho-166840059336123.jpg', NULL, 'DSAN109'),
('NB00194', 'Cơm Nhà Cậu Út', '368 Phú Riềng Đỏ .Tx Đồng Xoài, Bình Phước.', 'https://nhaxinhplaza.com/wp-content/uploads/cach-lam-goi-trai-va.jpg', NULL, 'DSAN109'),
('NB00195', 'Nhà hàng bò tơ Tây Ninh Năm Sánh', 'QL22B, Hiệp Trường, Hòa Thành, Tây Ninh.', 'https://khamphatayninh.vn/wp-content/uploads/2020/07/ut-nhan-1.jpg', NULL, 'DSAN110'),
('NB00196', 'Quán bò tơ Tây Ninh Sáu Tâm', '86 Nguyễn Trãi, Phường 4, Tây Ninh.', 'https://th.bing.com/th/id/OIP.1QEWunBoJzZaxOO2NFfaKgHaEK?rs=1&pid=ImgDetMain', NULL, 'DSAN110'),
('NB00197', 'Nông trại dưa lưới Happy Farm', 'Kênh Đông, Thị xã Trảng Bàng, Tây Ninh.', 'https://khamphatayninh.vn/wp-content/uploads/2020/07/dl-2.jpg', NULL, 'DSAN111'),
('NB00198', 'Vườn Dưa Lưới Đức Thành Farm', 'Xã Phan, Huyện Dương Minh Châu, Tây Ninh.', 'https://khamphatayninh.vn/wp-content/uploads/2020/07/dt-2-1920x1280.jpg', NULL, 'DSAN111'),
('NB00199', 'Quán gà Ma Thiên Lãnh Thu Sang', 'Ma Thiên Lãnh, Thạnh Tân, Tây Ninh.', 'https://toplist.vn/images/800px/oc-xu-nui-ba-273425.jpg', NULL, 'DSAN112'),
('NB00200', 'Quán ăn Đồng Quê', 'Số 18 Hẻm số 15 Ba Mươi Tháng Tư, Phường 2, Tây Ninh.', 'https://cdn.tgdd.vn/2021/07/content/osc-800x450.jpg', NULL, 'DSAN112'),
('NB00201', 'Chợ Đầu Mối', 'Phường 2, Tân An, tỉnh Long An.', 'https://images.toplist.vn/images/800px/thit-lon-muoi-chua-320625.jpg', NULL, 'DSAN113'),
('NB00202', 'Nhà hàng Lu Xưa', 'Bờ Kè – Ấp Lũy – Cần Giuộc – Long An.', 'https://mustgo.vn/files/uploads/1566493237-thit-chua-thanh-son-phu-tho-co-gi-dac-biet-2yn2pxd0w0etynqkbmxp8q.jpg', NULL, 'DSAN113'),
('NB00203', 'Chợ cũ Tân An', 'Ngõ Chợ, Phường 2, Tân An, tỉnh Long An.', 'https://cdn.tgdd.vn/2020/10/CookRecipe/Avatar/cach-nau-canh-chua-ca-keo-thumbnail-1.jpg', NULL, 'DSAN114'),
('NB00204', 'Quán lẩu và nướng cá Chèo Bẻo', 'số 170, Đường số 5, KDC Thái Dương, Phường 6, Tp. Tân An, Long An.', 'https://i.ytimg.com/vi/ST5lip1i24U/maxresdefault.jpg', NULL, 'DSAN114'),
('NB00205', 'Thanh long Châu Thành', 'ã Long Trì, Dương Xuân Hội, Hiệp Thành, An Lục Long huyện Châu Thành (Long An)', 'https://bazantravel.com/cdn/medias/uploads/30/30040-thanh-long-chau-thanh-670x446.jpg', NULL, 'DSAN115'),
('NB00206', 'Cơ sở sản xuất nem – Đặc sản Lai Vung', 'ĐT851, Tân Thành, Lai Vung, Đồng Tháp.', 'https://gotadi.com/tour/wp-content/uploads/2021/09/1-mon-ngon-dong-thap.jpg', NULL, 'DSAN116'),
('NB00207', 'Cơ sở sản xuất nem chua', 'ĐT851, Tân Thành, Lai Vung, Đồng Tháp.', 'https://cdn3.ivivu.com/2022/12/nem-Lai-Vung-ivivu-1.jpg', NULL, 'DSAN116'),
('NB00208', 'Vưạ Xoài Lý Hiền', 'Tịnh Thới, Tp.Cao Lãnh, Đồng Tháp.', 'https://dacsansenhong.vn/wp-content/uploads/2020/07/dac-san-dong-thap-xoai-cao-lanh.jpg', NULL, 'DSAN117'),
('NB00209', 'Vựa xoài - Quýt Hồng Hai Kiệt', 'Cầu Chùa, Long Hậu, Lai Vung, Đồng Tháp.', 'https://dacsansenhong.vn/wp-content/uploads/2020/07/dac-san-dong-thap-xoai-cao-lanh.jpg', NULL, 'DSAN117'),
('NB00210', 'Quán hủ tiếu bà Sẩm 6k', '188 Trần Hưng Đạo, Phường 1, Sa Đéc, Đồng Tháp.', 'https://gotadi.com/tour/wp-content/uploads/2021/09/2-mon-ngon-dong-thap.jpg', NULL, 'DSAN118'),
('NB00211', 'Hủ tiếu Cô Liên', '111 đường Trần Phú, phường 1, Tp. Sa Đéc, Đồng Tháp.', 'https://r2.nucuoimekong.com/wp-content/uploads/hu-tieu-sa-dec-dong-thap.jpg', NULL, 'DSAN118'),
('NB00212', 'Bún Cá Dạ Châu', 'đường Trần Hưng Đạo, phường Mỹ Thới, Thành phố Long Xuyên, tỉnh An Giang.', 'https://www.com.vn/upload/hinhanh/comvn-huong-dan-an-bun-ca-long-xuyen-an-giang-nhung-dia-chi-thanh-nien-tre-hoang-hau-cua-mon-ngon-xuy-tac-nay-1.jpg', NULL, 'DSAN119'),
('NB00213', 'Nhà hàng Địa Đạo', 'Tân Châu, An Giang.', 'https://dacsangatdinh.com/wp-content/uploads/2022/08/l%E1%BA%A7u-m%E1%BA%AFm-1-1024x768.jpg', NULL, 'DSAN119'),
('NB00214', 'Chè thốt nốt Cao Lãnh', '137 Lê Hồng Phong, Phường 4, Tp. Cao Lãnh, An Giang.', 'https://diachilamchame.com/wp-content/uploads/2021/07/cach-lam-che-thot-not-cao-lanh.jpg', NULL, 'DSAN120'),
('NB00215', 'Chè Thốt Nốt Bà Đức', 'Kênh Bắc, Phường Mỹ Xuyên, Long Xuyên, An Giang.', 'https://lh3.googleusercontent.com/proxy/M9rDz6ncQ6q2R_OBqfXlPycRGVlY6-vaMkIZjHPvZO3Am-oVDV5BL2yByF1VTMYCpxxJ8f8aBIpfnQpW_39eCzKoZmXDDRCqEYzqUoUpQWJ19w5UHdo', NULL, 'DSAN120'),
('NB00216', 'Quán Châu Đốc', 'Xã Mỹ Phú, Châu Phú, An Giang.', 'https://www.com.vn/upload/hinhanh/comvn-huong-dan-an-bun-ca-long-xuyen-an-giang-nhung-dia-chi-thanh-nien-tre-hoang-hau-cua-mon-ngon-xuy-tac-nay-1.jpg', NULL, 'DSAN121'),
('NB00217', 'Nhà hàng Nam Bộ', 'Lấp Vò, Tháp Mười, Đồng Tháp.', 'https://dacsangatdinh.com/wp-content/uploads/2022/08/l%E1%BA%A7u-m%E1%BA%AFm-1-1024x768.jpg', NULL, 'DSAN121'),
('NB00218', 'Quán hải sản Ớt Ngọt', '129 Trần Hưng Đạo, Dương Đông.', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/06_2021/mon-an-dac-san-kien-giang-goi-so-long.jpg', NULL, 'DSAN122'),
('NB00219', 'Chợ đêm Hà Tiên', 'Chợ đêm Hà Tiên, Nguyễn Trãi, Pháo Đài, tx. Hà Tiên, tỉnh Kiên Giang, Việt Nam.', 'https://www.yong.vn/Content/images/foods/goi-so-long-hoa-chuoi-kien-giang.jpg', NULL, 'DSAN122'),
('NB00220', 'Khu du lịch Núi Đèn (Hà Tiên)', 'đường Núi Đèn, khu phố 3, phường Pháo Đài, thị xã Hà Tiên.', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/06_2021/mon-an-dac-san-kien-giang-lau-ca-nham.jpg', NULL, 'DSAN123'),
('NB00221', 'Chợ đêm Hà Tiên', 'Chợ đêm Hà Tiên, Nguyễn Trãi, Pháo Đài, tx. Hà Tiên, tỉnh Kiên Giang, Việt Nam.', 'https://www.tourdulichbentre.com/images/lau-chua-sa-nghe-ca-nham-giau-kien-giang.jpg', NULL, 'DSAN123'),
('NB00222', 'Vườn Sầu Riêng Ông Tư Hiếu', 'Cửa Dương, Phú Quốc, tỉnh Kiên Giang', 'https://www.tourdulichbentre.com/images/vuon-trai-cay-kien-giang.jpg', NULL, 'DSAN124'),
('NB00223', 'Vựa Trái Cây 16', '16-17 Hai Bà Trưng, Vĩnh Thanh, Rạch Giá, tỉnh Kiên Giang.', 'https://dulichvietnam.com.vn/kinh-nghiem/wp-content/uploads/2020/08/tham-quan-vuon-trai-cay-lai-thieu.jpg', NULL, 'DSAN124'),
('NB00224', 'Quán Hạnh Phúc', '174 Ngô Quyền, TP. Cà Mau.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-ca-mau-2-1024x769.jpg', NULL, 'DSAN125'),
('NB00225', 'Chợ nổi Cà Mau', 'Chợ nổi TP. Cà Mau.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-ca-mau-2-1024x769.jpg', NULL, 'DSAN125'),
('NB00226', 'A Vòi quán', '52 Lý Thường Kiệt, phường 7, Cà Mau.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-ca-mau-3.jpeg', NULL, 'DSAN126'),
('NB00227', 'Quán Hạnh Phúc', '174 Ngô Quyền, TP. Cà Mau.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-ca-mau-3.jpeg', NULL, 'DSAN126'),
('NB00228', 'Vườn nhãn U Minh', '92M3 + 4QM, Ấp 2, huyện U Minh, tỉnh Cà Mau', 'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/10_2023/du_lich_sinh_thai.jpg', NULL, 'DSAN127'),
('NB00229', 'Lẩu mắm Hồng Gấm', '3/225B tỉnh lộ 38, phường 5, thành phố Bạc Liêu.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-bac-lieu-2-1024x768.jjpg', NULL, 'DSAN128'),
('NB00230', 'Quán Hải Sản Ốc Đầm Già Xì 2', '54, Ngô Quyền, Phường 1, Thành phố tỉnh thành Cà Mau, tỉnh Cà Mau.', 'https://cdn.vn.alongwalk.info/wp-content/uploads/2023/01/28004129/image-top-12-quan-lau-o-ca-mau-sieu-ngon-duoc-yeu-thich-nhat-630e2b3bbb84dffb7cde5e54a6eb7176.jpg', NULL, 'DSAN128'),
('NB00231', 'Bún nước lèo Năm Hớn', 'số 649 Trần Phú, khóm 1, phường 7, Bạc Liêu.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-bac-lieu-4-819x1024.jpg', NULL, 'DSAN129'),
('NB00232', 'Bún nước lèo Ba Phi', '210 Trần Hưng Đạo, Phường 5, Thành phố Cà Mau, Cà Mau.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-bac-lieu-4-819x1024.jpg', NULL, 'DSAN129'),
('NB00233', 'Chợ Bạc Liêu', 'Kios Số 10-11, Cửa Nam Chợ, Phường 3, Bạc Liêu', 'https://top10baclieu.com/wp-content/uploads/2021/06/Di-ngang-cho-Bac-Lieu-moi-xay.jpg', NULL, 'DSAN130'),
('NB00234', 'Cù Lao Dung', 'Ấp Võ Thành Văn, xã An Thạnh 3', 'https://1.bp.blogspot.com/-Ukvfr0qBw5M/WTUxcb1RzAI/AAAAAAABPxk/1yEsTK5MKnMymUgQtYv8fsWFzJ93xu0DACLcB/s1600/ImageHandler_005.jpg', NULL, 'DSAN131'),
('NB00235', 'Khu Du Lịch Sinh Thái Tràm Chim', 'số 72 phường 2 thành phố Sóc Trăng.', 'https://cdn.vn.alongwalk.info/wp-content/uploads/2023/09/06231945/image-top-15-dia-diem-du-lich-soc-trang-noi-tieng-dep-nhu-tien-canh-169399198597934.jpg', NULL, 'DSAN131'),
('NB00236', 'Vĩnh Châu', 'số 352 Trần Phú, khóm 1, phường 7, Sóc Trăng.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-bac-lieu-4-819x1024.jpg', NULL, 'DSAN132'),
('NB00237', 'Khu Du Lịch Sinh Thái Tràm Chim', 'số 72 phường 2 thành phố Sóc Trăng.', 'https://cdn.vn.alongwalk.info/wp-content/uploads/2023/09/06231945/image-top-15-dia-diem-du-lich-soc-trang-noi-tieng-dep-nhu-tien-canh-169399198597934.jpg', NULL, 'DSAN132'),
('NB00238', 'Chợ Dâu', '81D, Trần Quốc Toản, Khu phố 2, Phường 7, Thành phố Sóc Trăng.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-bac-lieu-4-819x1024.jpg', NULL, 'DSAN133'),
('NB00239', 'Chợ Phú Tân', 'Phú Tân, Chợ Lách, Bến Tre.', 'https://cdn3.ivivu.com/2021/06/1-17-1600x1067.jpg', NULL, 'DSAN134'),
('NB00240', 'Cửa hàng Bánh tráng Phơi sương Đồng Khánh', 'Hẻm 5, Đồng Khánh, Thị Trấn Chợ Lách, Chợ Lách, Bến Tre.', 'https://cdn3.ivivu.com/2021/06/1-17-1600x1067.jpg', NULL, 'DSAN134'),
('NB00241', 'Chợ Trần Hưng Đạo', 'Trần Hưng Đạo, Phường 4, Thành phố Bến Tre.', 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/08/ca-bong-sao-thom-ngon.png', NULL, 'DSAN135'),
('NB00242', 'Cửa hàng Bánh tráng Phơi sương Đồng Khánh', 'Hẻm 5, Đồng Khánh, Thị Trấn Chợ Lách, Chợ Lách, Bến Tre.', 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2018/08/ca-bong-sao-thom-ngon.png', NULL, 'DSAN135'),
('NB00243', 'Nhà hàng nổi', 'Số 138, đường Trần Phú, P.2, TP. Trà Vinh.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-tra-vinh-4.jpg', NULL, 'DSAN136'),
('NB00244', 'Bà Hai Quán', 'Lê Hồng Phong ,P.8, TP. Trà Vinh.', 'https://i.ytimg.com/vi/zv46OD9DZq8/maxresdefault.jpg', NULL, 'DSAN136'),
('NB00245', 'Chợ Trà Vinh', 'Nguyễn Du, P. 8, TP. Trà Vinh', 'https://hotel84.com/hotel84-images/news/img1/cho-tra-vinh-cong.jpg', NULL, 'DSAN137'),
('NB00246', 'Chợ Trà Vinh', 'Chợ Trà Vinh: Bạch Đằng, P.3, TP. Trà Vinh.', 'https://ik.imagekit.io/tvlk/blog/2022/09/dac-san-tra-vinh-6.jpg', NULL, 'DSAN138'),
('NB00247', 'Nhà hàng nổi', 'Số 138, đường Trần Phú, P.2, TP. Trà Vinh.', 'https://cdn.tgdd.vn/2021/07/CookProduct/14cachnauchaoca-1200x676.jpg', NULL, 'DSAN138'),
('NB00248', 'Quán bánh xèo hến', 'Đường Nguyễn Văn Thiệt, P3, Tp Vĩnh Long.', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-vinh-long-2-1024x576.jpeg', NULL, 'DSAN139'),
('NB00249', 'Hot Pot 72', '68/16B Phạm Thái Bường, TP. Vĩnh Long, Vĩnh Long.', 'https://img-global.cpcdn.com/recipes/f66c2d961af346f9/1200x630cq70/photo.jpg', NULL, 'DSAN139'),
('NB00250', 'Vườn Vãi Tiền Giang', 'Mỹ Hạnh Trung - Cai Lậy - Tiền Giang', 'http://wiki-travel.com.vn/Uploads/picture/hieuhieu-182826102836-bun-goi-gia.jpg', NULL, 'DSAN140'),
('NB00251', 'Nhà Hàng Đồng Khánh', 'số 49, Đường 2/9, Phường 1, Vĩnh Long', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-vinh-long-3-956x1024.jpeg', NULL, 'DSAN141'),
('NB00252', 'Tiệm Nướng Ụm Bò', '43/1E Nguyễn Văn Thiệt, TP. Vĩnh Long, Vĩnh Long', 'https://images.toplist.vn/images/800px/tiem-nuong-um-bo-1139030.jpg', NULL, 'DSAN141'),
('NB00253', 'Nhà hàng Hảo Hảo', 'Nguyễn Văn Thoại, P. 1, Mỹ Tho, Tiền Giang', 'https://media-cdn.tripadvisor.com/media/photo-s/1b/38/a1/0a/hu-tieu-my-tho.jpg', NULL, 'DSAN142'),
('NB00254', 'Quán Hà Nội', '37 Nguyễn Văn Thoại, P.1, TP Mỹ Tho, Tiền Giang', 'https://cf.bstatic.com/images/hotel/max1024x768/231/231522965.jpg', NULL, 'DSAN142');
INSERT INTO `NoiBan` (`IDNoiBan`, `TenQuan`, `DiaChi`, `LinkAnh`, `TrangThai`, `IDDacSan`) VALUES
('NB00255', 'Chợ Tân Quy Đông', 'Xã Tân Thạnh Đông, huyện Châu Thành, Bến Tre', 'https://diadiemanuong.com/wp-content/uploads/2018/03/Cho-tan-quy-dong-ben-tre-1.jpg', NULL, 'DSAN143'),
('NB00256', 'Nhà hàng Tân Quy Đông', '68 Đinh Bộ Lĩnh, phường Tân Thành, thành phố Mỹ Tho, Tiền Giang', 'https://www.vntrip.vn/cam-nang/wp-content/uploads/2022/08/du-lich-ben-tre-18.jpg', NULL, 'DSAN143'),
('NB00257', 'Nhà Hàng Tiến Thơ', '16 Ngô Quốc Trị, Phường 5, Vị Thanh, Hậu Giang.', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-hau-giang-1-1024x683.jpeg', NULL, 'DSAN144'),
('NB00258', 'Quán Lá Xanh', '19A Quốc Lộ 1A, Long Hòa A, Phụng Hiệp, Hậu Giang.', 'https://bepxua.vn/wp-content/uploads/2020/05/ca-loc-nuong-trui-1.jpg', NULL, 'DSAN144'),
('NB00259', 'Lẩu ốc Linh Phối', '34 QL1A, Hiệp Lợi, Ngã Bảy, Hậu Giang', 'https://ik.imagekit.io/tvlk/blog/2022/06/dac-san-hau-giang-2-1024x683.jpeg', NULL, 'DSAN145'),
('NB00260', 'Nhà Hàng Tiến Thơ', '16 Ngô Quốc Trị, Phường 5, Vị Thanh, Hậu Giang.', 'https://cdn.tgdd.vn/2020/07/CookRecipe/Avatar/oc-len-xao-sa-ot-thumbnail.jpg', NULL, 'DSAN145'),
('NB00261', 'Chợ Nổi Hậu Giang', 'Chợ Hậu Giang', 'https://r2.nucuoimekong.com/wp-content/uploads/cho-noi-nga-7.jpg', NULL, 'DSAN146'),
('NB00262', 'Nem nướng Hai Vân', '98 Đề Thám, quận Ninh Kiều, Cần Thơ.', 'https://statics.vinpearl.com/dac-san-can-tho-01_1635605338.jpg', NULL, 'DSAN147'),
('NB00263', 'Nem nướng Anh Mập', '18, Nguyễn An Ninh, Tân An, Ninh Kiều, Cần Thơ', 'https://statics.vinpearl.com/dac-san-can-tho-01_1635605338.jpg', NULL, 'DSAN147'),
('NB00264', 'Quán bánh cống Cô Út', '86/38 Lý Tự Trọng, phường An Cư, quận Ninh Kiều, Cần Thơ', 'https://statics.vinpearl.com/dac-san-can-tho-2_1635605627.jpg', NULL, 'DSAN148'),
('NB00265', 'Bánh cống bà Út Lư', '8 Trần Văn Hoài, quận Ninh Kiều, Tp. Cần Thơ', 'https://media.mia.vn/uploads/blog-du-lich/diem-danh-nhung-quan-banh-cong-ngon-nhat-o-can-tho-4-1649235998.jpg', NULL, 'DSAN148'),
('NB00266', 'Vườn trái cây Mỹ Khánh', '335 Lộ Vòng Cung, xã Mỹ Khánh, huyện Phong Điền, thành phố Cần Thơ', 'https://statics.vinpearl.com/vuon-trai-cay-can-tho-4_1627988530.jpg', NULL, 'DSAN149');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Tinh`
--

CREATE TABLE `Tinh` (
  `IDTinh` char(7) NOT NULL,
  `TenTinh` varchar(50) DEFAULT NULL,
  `GioiThieu` varchar(500) DEFAULT NULL,
  `LinkAnh` varchar(700) DEFAULT NULL,
  `IDVung` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `Tinh`
--

INSERT INTO `Tinh` (`IDTinh`, `TenTinh`, `GioiThieu`, `LinkAnh`, `IDVung`) VALUES
('TINH001', 'Cao Bằng', 'Cao Bằng là một tỉnh nằm ở phía Đông Bắc Việt Nam, có nhiều di sản thiên nhiên và văn hóa độc đáo. Đặc sản của Cao Bằng bao gồm gạo lúa, thịt dê, cá đồng và các loại nước mắm đặc trưng. Ngoài ra, Cao Bằng còn là nơi có nhiều di tích lịch sử và danh lam thắng cảnh nổi tiếng như Hồ Ba Bể và núi Hà Giang.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120396440_4528586103849515_7647022880216368547_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHJaakq7V_MnjzHqHkp3FzYxC4gU9XSNMnELiBT1dI0yUQwSasXfV4IW9KR-eBcHxiyyyWiln5LjesneWZ-DM0o&_nc_ohc=J0DQaUEA2LAAX_I4CBq&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfCZQqE8eRebWe7kg_jgMqs9XNRf1t9aShC2oH3ffL4wKQ&oe=663488B8', 'VUNG001'),
('TINH002', 'Sơn La', 'Sơn La là một tỉnh miền núi nằm ở phía Tây Bắc Việt Nam. Nơi đây có cảnh đẹp hùng vĩ với những dãy núi, thác nước, hồ nước lớn và nhiều bản làng của các dân tộc thiểu số. Sơn La còn nổi tiếng với các loại đặc sản như rượu cần, mật ong rừng, và nước mắm Ba Mùa.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120487223_4528587057182753_3154563486521352495_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGQp4CQn01hJGA10Rv9Y-VXB4G58KA0uKkHgbnwoDS4qRDH4lKvjw4xABiMWvmxmehvAI-78XfFEWXG81A9qvuF&_nc_ohc=IFiRsi2QuBEAX9I0Kmy&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfBXIiz_xBdNjSPEUPUEI9TTgrBax2Yk4bhNN3yUU06izg&oe=66348C86', 'VUNG001'),
('TINH003', 'Điện Biên', 'Điện Biên là một tỉnh miền núi nằm ở phía Tây Bắc Việt Nam, gần biên giới Lào. Điện Biên nổi tiếng với di tích lịch sử Điện Biên Phủ cùng với các loại đặc sản như mật ong rừng, rượu cần, và các loại nước mắm. Ngoài ra, vùng này còn có văn hóa dân tộc đặc sắc và các lễ hội truyền thống.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120332590_4528586793849446_3768286177872291282_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH4yjkgkS5Xfkk0Q1me24gePCKtjykQThw8Iq2PKRBOHOI45WWKov4TzhuG1eWRIwIhTETdCgn4gtu7Q0bBFryN&_nc_ohc=0XjfyQdSyrAAX-hBPpO&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfAMV1UoFWTWtuYbrmILkchiYhGyVQ21uds88dRpTPL-dQ&oe=66345FE8', 'VUNG001'),
('TINH004', 'Lai Châu', 'Lai Châu là một tỉnh nằm ở phía Tây Bắc Việt Nam, có địa hình núi non đồ sộ và hệ thống sông ngòi phong phú. Đặc sản của Lai Châu bao gồm mật ong rừng, rượu cần, thịt dê và các loại nước mắm đặc trưng. Với vẻ đẹp hoang sơ và văn hóa dân tộc phong phú, Lai Châu thu hút du khách muốn khám phá và trải nghiệm vùng núi Tây Bắc.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120188657_4528586780516114_6865998087384728188_n.png?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHm6FkEclIltZFDcA7rDeHKgsi5ut9lJb6CyLm632UlvtXO4jgaswNkDgTOEFTh99Qfl_xxxd1ukvRMJ-_PbglP&_nc_ohc=YgfFByjwXMoAX_p8Blr&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfCAjWbRJfurwsMFMtiNPS-bFesnlv9cElB-nuOrGhs3hw&oe=66348B1C', 'VUNG001'),
('TINH005', 'Yên Bái', 'Yên Bái là một tỉnh nằm ở vùng cao nguyên phía Bắc Việt Nam, với địa hình đa dạng từ núi cao đến thung lũng sâu. Đặc sản của Yên Bái bao gồm gạo lúa nổi tiếng, mật ong rừng, thịt dê, và rất nhiều loại rau củ. Ngoài ra, Yên Bái còn có nhiều di sản văn hóa dân tộc và các lễ hội truyền thống.', 'https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.6435-9/120538398_4528587077182751_5589781920917150854_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGO6lC350Giof3-8Lvh1yPTHw_16THBFswfD_XpMcEWzAQCeDFsizXqlE8fPVonfafmp8FprcKPgD3309ywGyG1&_nc_ohc=AyZHiLoOCQwAX-pbbLF&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfCKbIoOy6vvXol-1p1SIRIP0Bjl_wnenpopppjeE8r5Og&oe=66347C32', 'VUNG001'),
('TINH006', 'Phú Thọ', 'Phú Thọ là một tỉnh nằm ở phía Bắc Việt Nam, có nhiều di sản lịch sử và văn hóa quan trọng. Đặc sản của Phú Thọ bao gồm gạo lúa, lúa mạch, gà và các loại thảo dược quý. Ngoài ra, Phú Thọ còn là nơi diễn ra lễ hội Đền Hùng - một trong những lễ hội lớn nhất của dân tộc Việt Nam.', 'https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/120232100_4528586607182798_8106735990072647233_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGPg5PKXCs8_UTG1vFg71NwvdQHj_Qhfb-91AeP9CF9v-4yG9-vsbBiRcSBBAz6qiF49BJC0V7n79Rj3ItlA_4Z&_nc_ohc=Y8GglQPvKK0AX8wq3my&_nc_ht=scontent.fsgn5-14.fna&oh=00_AfA20AU-bJ63TSis90oxRkkXJg3v_yXeWMVKLRjb0zKelw&oe=66348D6D', 'VUNG001'),
('TINH007', 'Lào Cai', 'Lào Cai là một tỉnh nằm ở phía Tây Bắc Việt Nam, có biên giới với Trung Quốc. Với vị trí chiến lược và địa hình đa dạng, Lào Cai là điểm đến hấp dẫn của du khách. Đặc sản của Lào Cai bao gồm thịt lợn cap nach, rượu cần, và nhiều loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều bản làng dân tộc với nét văn hóa truyền thống đặc sắc.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120218740_4528586773849448_6960410510453775678_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFK6x5UwFtwJL3IgX3wfGZ2qhW-kNWkwYuqFb6Q1aTBiw3ApxSXBZR9V-wWDRfqPvEL7yjbjsdTfD1RVtUpW4e2&_nc_ohc=JNmzjVD2JZwAX9wqUTN&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfBV6Henbv22TZefi2Et605OHxSFNMzTVeA7csVdyZwP4g&oe=66346496', 'VUNG001'),
('TINH008', 'Tuyên Quang', 'Tuyên Quang là một tỉnh nằm ở phía Bắc Việt Nam, có nhiều di sản lịch sử và văn hóa đáng chú ý. Đặc sản của Tuyên Quang bao gồm rượu nếp, thịt lợn cap nach, và nhiều loại nước mắm đặc trưng. Ngoài ra, Tuyên Quang còn là nơi diễn ra nhiều lễ hội truyền thống và văn hóa dân tộc.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120261301_4528586107182848_1601284393421293003_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGb4opDlsr4vsPmMmj2d1kFquTAgEcWl_-q5MCARxaX_2FdzYuxbWTj2ayhLvdylfB98dZ3_pVNqlwKurKqLb3M&_nc_ohc=rY6aQR2xYcIAX-GHqVR&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfCJ_7lm9lr6s8qlllNMYvcZZlzi0w4HLfrkktqsypAkqg&oe=66346767', 'VUNG001'),
('TINH009', 'Hà Giang', 'Hà Giang là một tỉnh nằm ở phía Tây Bắc Việt Nam, có nhiều cảnh đẹp thiên nhiên hoang sơ và đồng bào dân tộc sống sinh động. Đặc sản của Hà Giang bao gồm mật ong rừng, rượu cần, thịt dê, và nhiều loại rau củ trái. Ngoài ra, Hà Giang còn có nhiều điểm du lịch nổi tiếng như đèo Mã Pí Lèng và thác nước Bản Giốc.', 'https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.6435-9/120237114_4528586087182850_7290473443251844494_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEHzEP15NfO4G-Twp91z5y92kh0LeEg_M7aSHQt4SD8zjcjuiN2en6csCbAvuvQ0K0ZEQYTBl-2X2FWx_sU-g1U&_nc_ohc=JpXqlol3m5gAX9-Q-27&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfDXUvfdw6s7g-WghBSNIy4m_UurA7zk1ANdiZ6Z2dbF4w&oe=66345C6F', 'VUNG001'),
('TINH010', 'Bắc Kạn', 'Bắc Kạn là một tỉnh nằm ở phía Đông Bắc Việt Nam, có nhiều di sản thiên nhiên và văn hóa đáng chú ý. Đặc sản của Bắc Kạn bao gồm rượu cần, thịt lợn cap nach, và nhiều loại nước mắm đặc trưng. Ngoài ra, Bắc Kạn còn là nơi sinh sống của nhiều dân tộc thiểu số với văn hóa đặc sắc.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120297895_4528586320516160_152418201185010536_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHWaUUjy6gOGrslVC8UN3hcKTt5n1WOl3gpO3mfVY6XeG9GGPHCxkozJLO77rH2VMjdPQB1Dqk3GQ0cRnB-kQZV&_nc_ohc=kVp8or0PISYAX-fW2N0&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfAAY1Ztyi1rZeMYrWw_x2vSEWuDoO_DsvQH8sUqjvmdsQ&oe=66349201', 'VUNG001'),
('TINH011', 'Thái Nguyên', 'Thái Nguyên là một tỉnh nằm ở phía Bắc Việt Nam, có nhiều di sản lịch sử và văn hóa đáng chú ý. Đặc sản của Thái Nguyên bao gồm trà, gạo lúa, thịt gà và các loại trái cây. Ngoài ra, Thái Nguyên còn là nơi diễn ra nhiều lễ hội truyền thống và có nhiều danh lam thắng cảnh đẹp.', 'https://scontent.fsgn5-12.fna.fbcdn.net/v/t1.6435-9/120257747_4528586333849492_8311902793211798698_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeELKD1hTYc-i7T2HSrDZN25y0RrqIQwJwrLRGuohDAnCmLiDsHGWEY2ILtmIWkiEVR2UmrNqlEldomXi0KFiVgH&_nc_ohc=tR2zyqtc5O8AX948d64&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfCoCsWVAFqMBAaY20VuiuoBD8I4NJy3hM_xeDJQotBsqw&oe=6634894C', 'VUNG001'),
('TINH012', 'Hòa Bình', 'Hòa Bình là một tỉnh miền núi nằm ở phía Bắc Việt Nam. Với thiên nhiên đa dạng và phong phú, Hòa Bình thu hút du khách bởi những cảnh đẹp hữu tình như hồ Ba Bể, hồ Mai Châu, đèo Kim Bôi, và thác Đá Bàn.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120221111_4528587097182749_3486127906765411389_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeG-OFYVDgoN-LkBCjZ8dAdUSqDiMS52p8RKoOIxLnanxDpL8fixlahZ2Ugz-Dr6uskquStrwxBsxF5ATAOmQq_a&_nc_ohc=MPrbQvhTBPkAX8jJ25p&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfCQ1KF0Oz3jf7ts6hCiZIO4NKcJ3GwCvYEpbKzNe02k2g&oe=663476EF', 'VUNG001'),
('TINH013', 'Lạng Sơn', 'Lạng Sơn là một tỉnh nằm ở phía Đông Bắc Việt Nam, có biên giới với Trung Quốc. Đặc sản của Lạng Sơn bao gồm trái lý, sò điệp, thịt dê và các loại nước mắm đặc trưng. Ngoài ra, Lạng Sơn còn là nơi có nhiều di tích lịch sử và văn hóa độc đáo.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120238004_4528586337182825_7375292790211194875_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF0TnCEgUueCNBY7i-tRIeaFEpIclGl5yEUSkhyUaXnIeymWKM_wHSx2IqTDTTD9YNeIL4JnGY1Eyc83O3joF2e&_nc_ohc=jnAke5r4GgoAX98ccbF&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfAWVKEwDpuoP8mbhbAZIb3uVsEvqaMsJ4D9PSnL7oGiAQ&oe=6634785C', 'VUNG001'),
('TINH014', 'Bắc Giang', 'Bắc Giang là một tỉnh nằm ở phía Bắc Việt Nam, có nhiều di sản lịch sử và văn hóa đáng chú ý. Đặc sản của Bắc Giang bao gồm quả lựu, chè, gà và các loại trái cây. Ngoài ra, Bắc Giang còn là nơi có nhiều lễ hội truyền thống và là trung tâm sản xuất chè lớn nhất Việt Nam.', 'https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/120198779_4528586563849469_8786197381513922846_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHMjJQN9aPFZHwyF8SnUEWbwVW_eH5aZdnBVb94flpl2RGkdog2W9fKAoNRhaCxfGOybHLaWlzY5oVroCroynTD&_nc_ohc=yKRDZvQOBmMAX8rFNuo&_nc_ht=scontent.fsgn5-11.fna&oh=00_AfAz9TpwwJ0bBGMIVaFM4PenocPton3Zpq3NrB1YzdVY-g&oe=66348D77', 'VUNG001'),
('TINH015', 'Hà Nội', 'Tỉnh Hà Nội nằm ở phía Bắc Việt Nam, là thủ đô của đất nước với nhiều di tích lịch sử và văn hóa đa dạng. Đặc sản của Hà Nội bao gồm phở, bún chả, bánh cuốn và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều điểm du lịch nổi tiếng và là trung tâm kinh tế, văn hóa của cả nước.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120200787_4528587263849399_8746943461434968213_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEvZrjc9bc3XvXl1Bl5rY3cjXn4OM3temiNefg4ze16aPvqZDLueRk7e5od-Bc3aEUas7PbwuDPiRzVgYhbOooY&_nc_ohc=p_gt0QTXXksAX95pvWf&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfAsMd3FO6OMZBJFKEOAiSjnM_aMXOZkXy2qWOEdZG0duQ&oe=66347855', 'VUNG002'),
('TINH016', 'Vĩnh Phúc', 'Tỉnh Vĩnh Phúc nằm ở phía Bắc Việt Nam, là một trong những tỉnh có nền kinh tế phát triển và cảnh quan thiên nhiên đẹp mắt. Đặc sản của Vĩnh Phúc bao gồm cơm lam, mật ong, rượu vang và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120528661_4528587323849393_1889468551297399525_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFOp7rLX_fR-FjZliTIxPgPZczOM29rRC1lzM4zb2tELVvL9U4ggoCfu-oP6_8oGBjGGSRfQadizSvmIeSGt9OI&_nc_ohc=DDvHsKMh82sAX_x_xEr&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfDIculhIWLEtT-Rrzj2v7mXKIs9iZ3mwNhHmMNX_Trc4A&oe=66348E0B', 'VUNG002'),
('TINH017', 'Bắc Ninh', 'Tỉnh Bắc Ninh nằm ở phía Bắc Việt Nam, là một trong những tỉnh có nền kinh tế phát triển và văn hóa đa dạng. Đặc sản của Bắc Ninh bao gồm bánh phồng tôm, mật ong, rượu quê và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120182213_4528587360516056_2400106237142524479_n.png?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFEbg12XjYHJnlMtVPrJTNj68gzRwW8usDryDNHBby6wHKBV3k-BaVq2kEUj_lVypESEcWbknFgIJ1ciFOUWwFQ&_nc_ohc=H5n2khpRAeUAX_ocKRO&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfBZMQvTmQzA7juUp49J9yd3wGaRbyqNx_ZFMGsCRcWykw&oe=663470A8', 'VUNG002'),
('TINH018', 'Hải Dương', 'Tỉnh Hải Dương nằm ở phía Bắc Việt Nam, là một trong những tỉnh có nền kinh tế phát triển và cảnh quan thiên nhiên đẹp mắt. Đặc sản của Hải Dương bao gồm bánh đậu xanh, mật ong, rượu gạo và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120242676_4528587670516025_1699312169834793002_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGATjnDO7gCz9J3tq7UOPPPyH89RkshoJ7Ifz1GSyGgnjh5f3z_mTdJ-2s6LOsJqGRD0s6HLQKpEP3Uv5ygTFO6&_nc_ohc=jpR9YzLRPHwAX_nRpkT&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfDVlwzeDXPO08a2WEMiiI9Kef-6MLePJkUzzgM90tqtlQ&oe=66348138', 'VUNG002'),
('TINH019', 'Hưng Yên', 'Tỉnh Hưng Yên nằm ở phía Bắc Việt Nam, là một trong những tỉnh có nền kinh tế phát triển và văn hóa đa dạng. Đặc sản của Hưng Yên bao gồm bánh gai, mật ong, rượu dừa và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-12.fna.fbcdn.net/v/t1.6435-9/120553883_4528587513849374_4368999692392371579_n.png?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGsNcqEZ_BfSL0ostOznYTRFJDZ91WjTA8UkNn3VaNMDys0vMhuQO7db8c37VMq5njf14f0T2BRym6odD3bCgqS&_nc_ohc=3XP5auanF-QAX916kms&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfCRyFEkeGEBcpLW1QIQ67wh-dIhXJGBCzSMaK5GGlTcoA&oe=6634651F', 'VUNG002'),
('TINH020', 'Thái Bình', 'Tỉnh Thái Bình nằm ở phía Bắc Việt Nam, là một trong những tỉnh có nền kinh tế phát triển và cảnh quan thiên nhiên đẹp mắt. Đặc sản của Thái Bình bao gồm bún ốc, mật ong, rượu nếp và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120361539_4528587870516005_3473023906990387085_n.png?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEpOxFw5Zl1-sNvie9GmPV6RpcdmXGs7ClGlx2ZcazsKeHpisKrbG0WOFRVl9212xmnyaFcHP-Z99boV2sntZin&_nc_ohc=odQYWNMGPxoAX-Afcc6&_nc_oc=AdjZnGKw1anCgi4sgqtn2HGSu5nnCUy0dw2zAfKiBGS6QN5dOh_uMoXmBco85_xMgI4&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfBC5BqGxBMNn-zV7xHFhaVfkpcY7xxd63r655o6ye-uBQ&oe=66346F26', 'VUNG002'),
('TINH021', 'Hà Nam', 'Tỉnh Hà Nam nằm ở phía Bắc Việt Nam, là một trong những tỉnh có nền kinh tế phát triển và văn hóa đa dạng. Đặc sản của Hà Nam bao gồm chả cá, mật ong, rượu gạo và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120220014_4528587637182695_199812293957231626_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFffl7GrBs9CoFcNONWoiQWvF2x76WpA8i8XbHvpakDyJQkGJRId5cPa1p97i7VQE1wPhlefZK_jCcDqIhrJJc1&_nc_ohc=DdVqp1Y-i1YAX-12Z_v&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfDZp5SG1dQ4XnHBPLr9fqjBBXpnoUyr6TH2Rx2TAlIweg&oe=663499E5', 'VUNG002'),
('TINH022', 'Ninh Bình', 'Tỉnh Ninh Bình nằm ở phía Bắc Việt Nam, là một trong những điểm du lịch nổi tiếng với cảnh quan thiên nhiên hùng vĩ và di tích lịch sử phong phú. Đặc sản của Ninh Bình bao gồm chả cá, mật ong, rượu gạo và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.6435-9/120200237_4528588013849324_8128012331270184028_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHuevfCs3lsx1Q2BuvW0vhKNyH-APVPweE3If4A9U_B4dk2_WKROdjGSQkHWDP8hmitVT_KJmMLjxFchP7bSWa-&_nc_ohc=ya-hvSQxfecAX8FuvfX&_nc_ht=scontent.fsgn5-3.fna&oh=00_AfAziLSePZMirx15EWe62p8zGmEfVRymphIB3kq9JRJN0w&oe=66347017', 'VUNG002'),
('TINH023', 'Nam Định', 'Tỉnh Nam Định nằm ở phía Bắc Việt Nam, là một trong những tỉnh có nền kinh tế phát triển và văn hóa đa dạng. Đặc sản của Nam Định bao gồm bánh dày, mật ong, rượu gạo và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/120186264_4528587860516006_655996655765784713_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGRYOgjvf01bt5fn_n-EYq4LOWqkwrYxWAs5aqTCtjFYBrX3a6EJpy8rzm3K3MOpNFZz38wvVIc-15BNSR5fDcZ&_nc_ohc=sY5sK-XZ4AMAX_8y3CO&_nc_ht=scontent.fsgn5-11.fna&oh=00_AfACZYVKGilHiEN24js-cRoULebg7V5aILNTZhyMAugK8A&oe=66348F40', 'VUNG002'),
('TINH024', 'Hải Phòng', 'Tỉnh Hải Phòng nằm ở phía Bắc Việt Nam, là một trong những tỉnh có nền kinh tế phát triển và là cảng biển lớn của Việt Nam. Đặc sản của Hải Phòng bao gồm bánh đậu xanh, mật ong, rượu vang và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120371663_4528587790516013_1513350252632588856_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeELuuf6yLda-Veg3cEQrmu4Gwe2-VHf6ScbB7b5Ud_pJ0dQBhsUrWuwAmKybG0TFhOf5bV_Q6eoi9CT7eLlVkmM&_nc_ohc=qLISpJCNnN0AX8iZwRl&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfB4_hrFD2s7UHfysXVULtaNL_iy0w_h474ArPJgR9pMZg&oe=66348E77', 'VUNG002'),
('TINH025', 'Quảng Ninh', 'Tỉnh Quảng Ninh nằm ở phía Bắc Việt Nam, là một trong những tỉnh có nền kinh tế phát triển và là điểm du lịch nổi tiếng với vịnh Hạ Long, di sản thiên nhiên thế giới. Đặc sản của Quảng Ninh bao gồm hải sản, mật ong, rượu gạo và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/120194784_4528586587182800_8882826638329025205_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEk6VTP09OE6IblPXDH7BqeV6MBIP5G5T1XowEg_kblPXDaRT7_z3HW7V5_N8bFUxf6BQhX8tXk7_UB3FyL0bZf&_nc_ohc=E7qRRhxyZA8AX-DbHLI&_nc_ht=scontent.fsgn5-11.fna&oh=00_AfDf6PRFHnCve_aK_jWEuVLGzI1qQO_kI9IBTWILhpg1kg&oe=66347A1C', 'VUNG002'),
('TINH026', 'Thanh Hóa', 'Tỉnh Thanh Hóa nằm ở miền Trung Việt Nam, là một trong những tỉnh có lịch sử phong phú và cảnh quan thiên nhiên đẹp mắt. Đặc sản của Thanh Hóa bao gồm hải sản, bún chả cá, mật ong và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.6435-9/120370369_4528588523849273_1529284128612195290_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeG-eS9IxWuKQp6Xux5Iocz-R7KoTmWPZx9HsqhOZY9nH3Fhz63ECLdQphHW54yZlS9-Pt0qpmj5ZvzEFxB8NUUU&_nc_ohc=1_sS7PXj_5QAX8frUAx&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfCiOVwv02UYpiAj40bsJMRP8NX5U3_EUQtDig4m3Q3rMQ&oe=6634902F', 'VUNG003'),
('TINH027', 'Nghệ An', 'Tỉnh Nghệ An nằm ở miền Trung Việt Nam, là nơi có những cảnh quan thiên nhiên hùng vĩ và văn hóa lịch sử đa dạng. Đặc sản của Nghệ An bao gồm hải sản, bún cá, mật ong và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là điểm du lịch sinh thái lý tưởng.', 'https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.6435-9/120332937_4528588080515984_2114641888897383413_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeENJ5zOzXB_Zuw6bZX4Fh1ddimEoS9Y6Ip2KYShL1joihqbHTWtVEP-gOSAky9DOuGsipvm-5RYG5PIMLJ_Ec0N&_nc_ohc=Yu1C3WGVNRgAX93P70h&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfCriGGXiWXxwyVTQMlmuiCTs5NQYHvBnb6bGTRKilFHbA&oe=66346B7F', 'VUNG003'),
('TINH028', 'Quảng Bình', 'Quảng Bình là một tỉnh nằm ở miền Trung Việt Nam, nổi tiếng với các hang động tự nhiên như Hang Sơn Đoòng và Hang En, cùng với những bãi biển tuyệt đẹp như Nhat Le và Bãi Đá. Đặc sản của Quảng Bình bao gồm các loại hải sản tươi ngon và các món ăn địa phương phong phú. Ngoài ra, vùng này còn có nhiều di sản văn hóa và lịch sử đáng khám phá.', 'https://scontent.fsgn5-12.fna.fbcdn.net/v/t1.6435-9/120229276_4528588337182625_6806313369920703375_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF_I-rGIhqtS7wouplQE-f43YCSmsEy-XrdgJKawTL5eqTxCSWnEnIwsVa4YOjM7uccSjkFtQm3-Sw-80t7bFNo&_nc_ohc=IeN2UZ3EAhIAX-r7sDN&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfA3vQG3gAICZJaMeb9HprrdaJ6bRRyP22TDFpW6LL-HbQ&oe=66346EA2', 'VUNG003'),
('TINH029', 'Quảng Trị', 'Quảng Trị là một tỉnh nằm ở miền Trung Việt Nam, là nơi diễn ra nhiều trận đánh trong chiến tranh Việt Nam. Đặc sản của Quảng Trị bao gồm các loại hải sản tươi ngon như tôm, cá và sò điệp, cùng với các món ăn đậm đà hương vị. Ngoài ra, Quảng Trị còn là nơi có nhiều di tích lịch sử và văn hóa độc đáo.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120241282_4528588590515933_5659299567586819806_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGWtWJO_-t3YmN_ifY9Gk6vS90mGX_y_LpL3SYZf_L8unfUr0zrteOYVyLcO41zvDXPA0BqTOOUZ1ZJOoLAR3eu&_nc_ohc=wY-70lX6FygAX-sWt07&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfCRaHgLF0heb6nma19j7iZIuvh8r4vdPxY8QQdYPnRIIg&oe=66347DBD', 'VUNG003'),
('TINH030', 'Thừa Thiên - Huế', 'Thừa Thiên - Huế là một tỉnh nằm ở miền Trung Việt Nam, nổi tiếng với di sản văn hóa lịch sử phong phú và cảnh quan thiên nhiên đẹp mắt. Đặc sản của Thừa Thiên - Huế bao gồm bún bò Huế, nem lụi, bánh bèo và các loại hải sản tươi ngon. Ngoài ra, vùng này còn có nhiều di tích và danh lam thắng cảnh nổi tiếng.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120199694_4528588770515915_112929147995427758_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeE3sGIuboIo4mv2doH2WeTwJb9xpK-vWd0lv3Gkr69Z3c-79BtigEyLBnrewqdRm5opgCFT2V3WdNrnj9b2c2iI&_nc_ohc=UCi7lD1k3YAAX9_sU0_&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfD-K4KSNwGBhgoVKYoTg1OuicDwOmmwH3SDa0KTIiOV6w&oe=66348349', 'VUNG003'),
('TINH031', 'Hà Tĩnh', 'Hà Tĩnh, một tỉnh nằm ở miền Trung Việt Nam, nổi tiếng với đa dạng đặc sản nông sản và hải sản. Gạo Hà Tĩnh, được trồng trên những cánh đồng bát ngát, mang lại hương vị đặc biệt và chất lượng cao. Hà Tĩnh cũng là nơi sản xuất hồ tiêu, cà phê và rau cải. Bên cạnh đó, các loại hải sản như cá, tôm, cua và sò điệp từ vùng biển Hà Tĩnh cũng được đánh giá cao về chất lượng và hương vị tinh tế.', 'https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/120258813_4528591487182310_5089697866396868300_n.png?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFU0mfRi9Vucn2VuuFx7nDfuR2NCAO8ixe5HY0IA7yLFzhfv5aLxNfDKRg5E-nCWj4Gzvu_Ak5U41NyiS2OHCSF&_nc_ohc=vBP472kX4o4AX_3mLnR&_nc_ht=scontent.fsgn5-11.fna&oh=00_AfAbsWgm9KLZRaFTfkcV0LIOK27lbx23onarZfxIyjEueQ&oe=66346A01', 'VUNG003'),
('TINH032', 'Quảng Nam', 'Quảng Nam là một tỉnh nằm ở miền Trung Việt Nam, có nhiều di sản lịch sử và văn hóa đặc sắc. Đặc sản của Quảng Nam bao gồm mì Quảng, bánh mì phượng, bánh tráng cuốn thịt heo và các loại hải sản tươi ngon. Ngoài ra, vùng này còn có nhiều di tích cổ kính và là nơi diễn ra nhiều lễ hội truyền thống.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120519621_4528588980515894_2231470553887620261_n.png?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHLQn3L_Bn-ENIhBn-G0OD4iKGeiapDVemIoZ6JqkNV6eGu5pps8J4M-pB-WZ57bnOgMSMTEGWrEMQGi5bu1aky&_nc_ohc=v7v71k6L90wAX_eKHAX&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfAeCVidP2wj2eepUTWncS_BcZE0KvYhmM0hGXEqVPMD6A&oe=66348FB6', 'VUNG004'),
('TINH033', 'Đà Nẵng', 'Đà Nẵng là một thành phố trực thuộc trung ương nằm ở miền Trung Việt Nam, có vị trí địa lý chiến lược và cảnh quan thiên nhiên đẹp mắt. Đặc sản của Đà Nẵng bao gồm mì Quảng, bánh xèo, bún chả cá và các loại hải sản tươi ngon. Ngoài ra, Đà Nẵng còn là nơi có nhiều di tích và danh lam thắng cảnh nổi tiếng.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120199156_4528588803849245_7209677924888681718_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHZjOPpTTrL0Sc--oS7Q07b9HRTxNd9r5P0dFPE132vkyay_uHoU_K6Pd2l582BUAiLf3SbHsIlieX4X5YmqI2W&_nc_ohc=xnzmbpyyC_wAX9oue-L&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfD6KpQ1ZVS_2-btd3QdI09n7jc6FwaURtPMl9CLQWWszw&oe=663488B5', 'VUNG004'),
('TINH034', 'Quảng Ngãi', 'Quảng Ngãi là một tỉnh nằm ở miền Trung Việt Nam, có nhiều cảnh đẹp thiên nhiên và di sản lịch sử đặc biệt. Đặc sản của Quảng Ngãi bao gồm bánh dày, bánh tráng cuốn thịt heo, bánh đập và các loại hải sản tươi ngon. Ngoài ra, vùng này còn có nhiều di tích lịch sử và văn hóa đáng chú ý.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120194785_4528589067182552_2301519275254563803_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGvLeCuZuEC6uoW5Ca-YEwgaORc_pQRLglo5Fz-lBEuCYdc12dvhqq5enS3KvJoGDh_-IHeDmf-91n3zqHU9Aou&_nc_ohc=oFy3lpmgnhQAX9xeTfC&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfAmhS47g9ITgAnr60fXlfsDuPZxjm69oMsIXxinUqMYww&oe=66347C2F', 'VUNG004'),
('TINH035', 'Bình Định', 'Bình Định là một tỉnh nằm ở miền Trung Việt Nam, có nhiều di sản lịch sử và văn hóa đáng chú ý. Đặc sản của Bình Định bao gồm bún chả cá, bánh xèo, nem nướng và các loại hải sản tươi ngon. Ngoài ra, vùng này còn có nhiều di tích cổ kính và là nơi diễn ra nhiều lễ hội truyền thống.', 'https://scontent.fsgn5-12.fna.fbcdn.net/v/t1.6435-9/120200127_4528589167182542_1635091614646546250_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEgWOEwq_CBb8VaK4DFrfMRjmZBsQy6dbyOZkGxDLp1vPUWGfR4oTzw5C4eppEdTJPyLCnZJhMkKZ5tx05wbyWk&_nc_ohc=attmxobh870AX8tEu2C&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfDzWuv-ptBxKHKMAL4M_FJIM69AzIRoUgYn1YfbxuxJsA&oe=66348529', 'VUNG004'),
('TINH036', 'Phú Yên', 'Phú Yên là một tỉnh nằm ở miền Trung Việt Nam, có cảnh đẹp thiên nhiên hoang sơ và nền văn hóa độc đáo. Đặc sản của Phú Yên bao gồm bún hải sản, nem chua, bánh canh ghẹ và các loại hải sản tươi ngon. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi diễn ra nhiều lễ hội truyền thống.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120490890_4528589273849198_430273705018543097_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF2O9IpOPhj_R8I1Gv5QNOgo7kCTCnq-EujuQJMKer4Szukgj7ItDW7M2NEEExPez01qJXX-HIJcHNs9Funl8ce&_nc_ohc=HOQo30EHjMMAX_BYuSu&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfABexEgwTY4FzW0L3Y-njRzssbBOAFDb_BAIZx5OAOKvA&oe=6634941E', 'VUNG004'),
('TINH037', 'Khánh Hòa', 'Khánh Hòa là một tỉnh nằm ở miền Trung Việt Nam, nổi tiếng với bãi biển đẹp và du lịch biển. Đặc sản của Khánh Hòa bao gồm nem nướng, bánh căn, bánh canh chả cá và các loại hải sản tươi ngon. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi diễn ra nhiều sự kiện văn hóa và giải trí.', 'https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/120200347_4528589360515856_1622987739113847682_n.png?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFreCeoWbeId6DXrJK6pQv1ojHQn9yTJ7iiMdCf3JMnuFpNG3sFpvJACCzx41M75zqnrd3ZLQWJGe8rt7326cm-&_nc_ohc=deArOW9sIIIAX_DSiLy&_nc_ht=scontent.fsgn5-11.fna&oh=00_AfAuSSsOMMaIQa4SsUyO3fUMwivUWIsl3hB2eCVFEm-Z7w&oe=66348288', 'VUNG004'),
('TINH038', 'Ninh Thuận', 'Ninh Thuận là một tỉnh nằm ở miền Trung Việt Nam, có cảnh đẹp thiên nhiên và di sản văn hóa độc đáo. Đặc sản của Ninh Thuận bao gồm bánh căn, nem nướng, chả cá nướng và các loại hải sản tươi ngon. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi diễn ra nhiều lễ hội truyền thống.', 'https://scontent.fsgn5-12.fna.fbcdn.net/v/t1.6435-9/120316559_4528589470515845_5595988773262688430_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEY9EWxSA1F4BlgAxDKdHQjMD9uTWYrmBgwP25NZiuYGMJZcdRxoo9K5abnrG8SRT-Nu09ytN5J3LYVgsp9tlit&_nc_ohc=EyLHVOGud-0AX-OogkX&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfA4_mdGkmuCnaSroCe-qg3atQz8xmG_v9vmjspoI0pAKw&oe=663481F4', 'VUNG004'),
('TINH039', 'Bình Thuận', 'Bình Thuận là một tỉnh nằm ở miền Trung Việt Nam, nổi tiếng với bãi biển đẹp và các làng chài truyền thống. Đặc sản của Bình Thuận bao gồm bánh căn, bún cá, bánh hỏi và các loại hải sản tươi ngon. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120390363_4528589550515837_6720234333452140826_n.png?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEGd9ZftZmsqTd9vKCOXvZdjjZ9j-ZmIfeONn2P5mYh918CiNpuPZ01STyUlTXwiOsRX1bEnPKwW7jKxoDb2ZiV&_nc_ohc=QiXFhD8AglsAX-WfBGg&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfA0rpWFEEQQJT_sUhiB4v6Fq4mo4zL3C_jFflO-5Npwfw&oe=6634900C', 'VUNG004'),
('TINH040', 'Kon Tum', 'Kon Tum là một tỉnh nằm ở miền Trung Việt Nam, có nhiều di sản thiên nhiên và văn hóa đặc sắc. Đặc sản của Kon Tum bao gồm cơm lam, bánh tráng trộn, thịt nai và các loại trái cây đặc trưng. Ngoài ra, vùng này còn có nhiều điểm du lịch đẹp và là nơi sinh sống của nhiều dân tộc thiểu số với văn hóa đa dạng.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120611345_4528589733849152_7708470757304409257_n.png?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeG0dWuXQeoYRvWtKSZDgCNG4LY2c_6jX0_gtjZz_qNfT8dAH_zLDUkZQ6ZDq2OclfO25XR5CKjvtk5qXtaAhFbG&_nc_ohc=g7hAL4QCOzcAX-ivMdg&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfCNf7V9GzodWdJ78-i_zJuPSu-z_CScUJYRqnhlX24yOg&oe=6634B309', 'VUNG005'),
('TINH041', 'Gia Lai', 'Gia Lai là một tỉnh nằm ở miền Trung Việt Nam, có nhiều di sản văn hóa và lịch sử đáng chú ý. Đặc sản của Gia Lai bao gồm cơm lam, bánh bèo, thịt nai và các loại trái cây đặc trưng. Ngoài ra, vùng này còn có nhiều điểm du lịch đẹp và là nơi sinh sống của nhiều dân tộc thiểu số với văn hóa đa dạng.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120346976_4528589637182495_2614104855207824696_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFU1xihn-XOp0G1xfbyqOXHjFM1PH3_h8iMUzU8ff-HyAeegQ0PSgqZPItxHar4DdUk5hTwAj5bpdm8mtmN7UGC&_nc_ohc=-9UWtGExBMQAX9CxAEG&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfC0CXzs9f0huHHuMcmaeyshk4OuqpnKByor_GjpjcASpA&oe=6634A90D', 'VUNG005'),
('TINH042', 'Đắk Lắk', 'Đắk Lắk là một tỉnh nằm ở miền Trung Việt Nam, có nhiều di sản thiên nhiên và văn hóa độc đáo. Đặc sản của Đắk Lắk bao gồm cà phê, rượu cần, thịt gà và các loại trái cây đặc trưng. Ngoài ra, vùng này còn có nhiều điểm du lịch đẹp và là nơi sinh sống của nhiều dân tộc thiểu số với văn hóa đa dạng.', 'https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.6435-9/120524134_4528589783849147_2520137557367522510_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGNrNRGXUNnCN5QLKSjRyMthinLuLAyde2GKcu4sDJ17albXsEbVk7jO-i0vO0CG5fWQw0qPhiY7pHOsoHRJPPu&_nc_ohc=nUPvQ5VFbOQAX9gd45G&_nc_ht=scontent.fsgn5-3.fna&oh=00_AfAWAm5350yWwIhWwCbSPdOgl8wRLYrJgcLJkQ_SSqbStg&oe=66347C3B', 'VUNG005'),
('TINH043', 'Đắk Nông', 'Đắk Nông là một tỉnh nằm ở miền Trung Việt Nam, có nhiều di sản thiên nhiên và văn hóa độc đáo. Đặc sản của Đắk Nông bao gồm cà phê, rượu cần, thịt gà và các loại trái cây đặc trưng. Ngoài ra, vùng này còn có nhiều điểm du lịch đẹp và là nơi sinh sống của nhiều dân tộc thiểu số với văn hóa đa dạng.', 'https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.6435-9/120297249_4528589970515795_7842665933278661871_n.png?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFV7zLqW7m0N6VrtsYEfJ1k5YW4YcE_IXnlhbhhwT8heZCwaPjvdMUBAkq5ikwtq-i08fFndgFVs1SF48koBU6d&_nc_ohc=4BJGMKoHMFEAX8fONHm&_nc_ht=scontent.fsgn5-15.fna&oh=00_AfA5aJP1cojpA_BOuPexy-kn0VQ3Eas4c9cS0itfSHwc6A&oe=66348E15', 'VUNG005'),
('TINH044', 'Lâm Đồng', 'Lâm Đồng là một tỉnh nằm ở miền Trung Việt Nam, có cảnh đẹp thiên nhiên đa dạng và khí hậu mát mẻ quanh năm. Đặc sản của Lâm Đồng bao gồm dâu tây Đà Lạt, cà phê, rau sạch và các loại trái cây đặc trưng. Ngoài ra, vùng này còn có nhiều điểm du lịch nổi tiếng và là nơi sản xuất nông sản lớn nhất miền Trung.', 'https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/120199698_4528589890515803_883274100446078593_n.png?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEUDmF1B8yeOGgm68e4ncxcLUrqtvbFAeItSuq29sUB4oLAZVbHjhzBHsCjEq2i8tPW0BUAbOktC_04yjjNcWxi&_nc_ohc=VnRvtT7f1ocAX9K53as&_nc_ht=scontent.fsgn5-11.fna&oh=00_AfDdrDgf0HqGuaPxlRo9ehG2uq7bDzc3o4Jwx6E2do3IkA&oe=6634891D', 'VUNG005'),
('TINH045', 'Thành phố Hồ Chí Minh', 'Thành phố Hồ Chí Minh, trước đây là Sài Gòn, là trung tâm kinh tế, văn hóa và du lịch của Việt Nam. Nơi đây có các đặc sản ẩm thực phong phú như bánh mì, phở, cà phê sữa, hủ tiếu, bánh xèo và nhiều loại hải sản. TP. Hồ Chí Minh cũng nổi tiếng với các di tích lịch sử, những công trình kiến trúc độc đáo và nhịp sống sôi động.', 'https://scontent.fsgn5-12.fna.fbcdn.net/v/t1.6435-9/120418620_4528590047182454_6866262061550511475_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH9VP8AZSLu1ndCsO9kkeZv1nSb96VXpQPWdJv3pVelA5bHYPn8Ol2pPAHT6rFmFblFHQb2ero-qPhkvXQhy7Ku&_nc_ohc=2o9ja3PCNSQAX9LdiOC&_nc_ht=scontent.fsgn5-12.fna&oh=00_AfAaGM-3bS-8D7zphebb4PtiR_DLi7RYGHDZ1xTwOPWCzw&oe=66347F8C', 'VUNG006'),
('TINH046', 'Đồng Nai', 'Tỉnh Đồng Nai nằm ở miền Nam Việt Nam, là một trong những tỉnh phát triển về công nghiệp và nông nghiệp. Đặc sản của Đồng Nai bao gồm bánh tráng, bún bò Huế, mì quảng và các loại trái cây nhiệt đới. Ngoài ra, Đồng Nai còn có nhiều điểm du lịch đẹp và là nơi sinh sống của nhiều dân tộc thiểu số với văn hóa đa dạng.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120195255_4528590373849088_4290888256683602862_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH1dhgrqt4YLJLz0UIa6i91Hb0Yas_ZIJUdvRhqz9kglcs_ZgcwVC49WFhtcFqex7MKBFSXfTRoLvWf6RWDmziR&_nc_ohc=VUnWAEJ-p6oAX96fRFZ&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfDthe1HpNgwF-tSpPNWkPzsAw2rKJalc1M9W1UugU6uuQ&oe=6634AC44', 'VUNG006'),
('TINH047', 'Bình Dương', 'Tỉnh Bình Dương nằm ở miền Nam Việt Nam, là một trong những trung tâm công nghiệp và kinh tế phát triển của cả nước. Đặc sản của Bình Dương bao gồm bánh mì, bún bò Huế, nem nướng và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/120232099_4528590203849105_6468558673465385853_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEhT5ebWW_L5MsRI6S_xPGOHBp26geCFAscGnbqB4IUC0M4HOZc0u-QSJjEKwx-zoc7Kp9hqsTj7Shx3P9Sztrz&_nc_ohc=Csl8LAjcubsAX8IhDnM&_nc_ht=scontent.fsgn5-14.fna&oh=00_AfDOUBcMgBPkYJN5z04l8ojCox99WpdGIZ-S-xIzDGZAjw&oe=6634ADED', 'VUNG006'),
('TINH048', 'Bà Rịa - Vũng Tàu', 'Tỉnh Bà Rịa - Vũng Tàu nằm ở miền Nam Việt Nam, có cảnh đẹp biển nổi tiếng và nguồn tài nguyên hải sản phong phú. Đặc sản của Bà Rịa - Vũng Tàu bao gồm hải sản tươi ngon như tôm, cua, cá và sò điệp, cùng với các món ăn biển độc đáo. Ngoài ra, vùng này còn có nhiều điểm du lịch biển và là nơi nghỉ dưỡng lý tưởng.', 'https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.6435-9/120196946_4528590437182415_2111787913726135202_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFZEO76JLl54XBFdIL2ORVN08iAVpfr4b_TyIBWl-vhv4wlUVJ47vm_rA8siiIvig6sEM-bepK_solp4M_YEB2P&_nc_ohc=u-JuPhN1NLQAX9VoMtU&_nc_ht=scontent.fsgn5-15.fna&oh=00_AfD2ma-U3mANV5k2SJUUykiesgg0z9YV5kC_4ELqiulyXg&oe=663497B7', 'VUNG006'),
('TINH049', 'Bình Phước', 'Tỉnh Bình Phước nằm ở miền Nam Việt Nam, là một trong những khu vực có nền kinh tế phát triển nhanh chóng. Đặc sản của Bình Phước bao gồm bánh tráng, mì quảng, bún chả cá và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều điểm du lịch đẹp và là nơi sinh sống của nhiều dân tộc thiểu số với văn hóa đa dạng.', 'https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/24/2/29/binh-phuoc-san-sang-don-song-fdi-tu-cac-doanh-nghiep-chau-au_65e046c4dbebd.jpg', 'VUNG006'),
('TINH050', 'Tây Ninh', 'Tỉnh Tây Ninh nằm ở miền Nam Việt Nam, là nơi có nền kinh tế phát triển và văn hóa độc đáo. Đặc sản của Tây Ninh bao gồm bánh canh, hủ tiếu, bánh tráng trộn và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi diễn ra nhiều lễ hội truyền thống.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120202471_4528590297182429_8638108329505556787_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHuoXqpPfujW8sgl10gvwi8HYXULeBmC0wdhdQt4GYLTKYEYv8rbyvdtusZOHaHkDEYBVYk9n14HJE-nMxclTGZ&_nc_ohc=mPU-nQn_XRwAX8AF7kV&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfCU-CzqUvWsMZ14GtJ8xdd5T5GjzZBxACpXFNtns_dNqQ&oe=66347FAB', 'VUNG006'),
('TINH051', 'Long An', 'Tỉnh Long An nằm ở miền Nam Việt Nam, có vị trí chiến lược trong phát triển kinh tế và địa lợi trong nông nghiệp. Đặc sản của Long An bao gồm bánh mì, hủ tiếu, bánh mì chảo và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120235416_4528590547182404_8322051117087093421_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFnDWLSUyIUhC9BYEqUXofYqQRLhff5KP-pBEuF9_ko_xX8NNcg-ueoSIqhnEBH6HD39rT4DvvTGupz2tS0wKaK&_nc_ohc=OvjYt5WxBn8AX8m5LOi&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfDuOgI1P5MQeQE_v7uMMMqep9_-ou1X9deXs8Yhzr3DbA&oe=6634916F', 'VUNG007'),
('TINH052', 'Đồng Tháp', 'Tỉnh Đồng Tháp nằm ở miền Nam Việt Nam, là một trong những tỉnh có nền nông nghiệp phát triển. Đặc sản của Đồng Tháp bao gồm bánh xèo, bún bò Huế, bún chả cá và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi diễn ra nhiều lễ hội truyền thống.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120203119_4528590593849066_2430038123831589927_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEsV_WfR8U6NnI52DQREzVLUMNhR1FlaHFQw2FHUWVocTGgZiYQVd3lyD1sC9jCR2Wb5QCRR_JaUUZXRxIZ6owU&_nc_ohc=ntkjmwyvcqsAX_9gWiL&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfA1YR31q89t5iocc279HNJg1dtzB8C3Df2fYneUNSljxg&oe=6634AC11', 'VUNG007'),
('TINH053', 'An Giang', 'Tỉnh An Giang nằm ở miền Nam Việt Nam, là một trong những tỉnh có nền kinh tế phát triển và nông nghiệp mạnh mẽ. Đặc sản của An Giang bao gồm bánh xèo, bánh mì chảo, bún mắm và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều điểm du lịch đẹp và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.6435-9/120324907_4528591133849012_3451589653514250519_n.png?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEmzS4XW1PGCcDL32OlKVPaOEPYKi5TgyU4Q9gqLlODJcISfAJOwHJvZZnqYRfxfAOaZlPbkWrr9m1CoQEcYzsz&_nc_ohc=b_MuZoWo6x8AX8D7i7N&_nc_ht=scontent.fsgn5-15.fna&oh=00_AfA__W6aef6dzs_UzIjrZ0tGx3kh06KYxg5a7Y55OX1bjA&oe=6634A40C', 'VUNG007'),
('TINH054', 'Kiên Giang', 'Tỉnh Kiên Giang nằm ở miền Nam Việt Nam, là một trong những địa điểm du lịch biển nổi tiếng của cả nước. Đặc sản của Kiên Giang bao gồm hải sản tươi ngon như tôm, cá, sò điệp và cua, cùng với các món ăn biển độc đáo. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi nghỉ dưỡng lý tưởng.', 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/120199919_4528591460515646_2037056656444188191_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeETYzzNdRQ0lclBwnKqsNPIzbs8qnLBG4PNuzyqcsEbg0cvhpvFUeFhkEPJxrKhE5-_LSq5j-KvOAbuZSKiAKoU&_nc_ohc=lXb8ydjh-gUAX-Wph_P&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfBSy1P8Ek96myoXwRAlFMb2hu4hRasJHugEcqj2Qu1HKQ&oe=66349EFD', 'VUNG007'),
('TINH055', 'Cà Mau', 'Tỉnh Cà Mau nằm ở miền Nam Việt Nam, là một trong những điểm đất cuối cùng của Việt Nam với cảnh đẹp thiên nhiên và nguồn tài nguyên hải sản phong phú. Đặc sản của Cà Mau bao gồm các loại hải sản tươi ngon như tôm, cua, cá và sò điệp, cùng với các món ăn biển độc đáo. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi du lịch sinh thái hấp dẫn.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120508533_4528591733848952_6899627142229483660_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEm3l2ttKU94xTmdMReUDV_poXgqYmbs0KmheCpiZuzQrepBGlvvZiGPcAgJJ-EzljDI3ID8zLlIvU8DI53RdCO&_nc_ohc=DCmDrCfc8cwAX8Js2Gr&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfBGv_yF4dcBmjXKSjpeln9jdvOJUO-p6BOIc0qTS76szg&oe=66346F97', 'VUNG007'),
('TINH056', 'Bạc Liêu', 'Tỉnh Bạc Liêu nằm ở miền Nam Việt Nam, là một trong những điểm du lịch sinh thái hấp dẫn với cảnh đẹp thiên nhiên và nguồn tài nguyên hải sản phong phú. Đặc sản của Bạc Liêu bao gồm các loại hải sản tươi ngon như tôm, cua, cá và sò điệp, cùng với các món ăn biển độc đáo. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi du lịch nghỉ dưỡng lý tưởng.', 'https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/120272598_4528591663848959_9126865645051285201_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGMcYRjXCZoIngkLLrRAvy47x5hOQEP7QXvHmE5AQ_tBSNdRvtDZCOigx4wSaOUxFNUfXZxcjm1RAHkAAGnU2Pn&_nc_ohc=nO4OYKqENCgAX-tuZBX&_nc_ht=scontent.fsgn5-14.fna&oh=00_AfDoYHCqVA8hjtsMgHqhad2s0_a2NdshyEjAw5_7ftt2fQ&oe=66348A10', 'VUNG007'),
('TINH057', 'Sóc Trăng', 'Tỉnh Sóc Trăng nằm ở miền Nam Việt Nam, là một trong những điểm du lịch sinh thái hấp dẫn với cảnh đẹp thiên nhiên và văn hóa dân tộc độc đáo. Đặc sản của Sóc Trăng bao gồm bún mắm, bánh xèo, bánh mì chảo và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/120193965_4528591623848963_8997493950335777806_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEK72_PYRgQiiYReoWicv9F0XDjuZxU9n_RcOO5nFT2f5x9nLWJU_k0Gn85SKo3uCEB-VAvoI9Mbvc3TRxiC18k&_nc_ohc=dAf_OLL6qgcAX-7yHSk&_nc_ht=scontent.fsgn5-14.fna&oh=00_AfBSVmidY6itRjRjPOCFZus1qhastqANCtt7yHlcL1PgwA&oe=66348127', 'VUNG007'),
('TINH058', 'Bến Tre', 'Tỉnh Bến Tre nằm ở miền Nam Việt Nam, là một trong những vùng đất nổi tiếng với nguồn tài nguyên thiên nhiên phong phú và văn hóa dân tộc đa dạng. Đặc sản của Bến Tre bao gồm bánh xèo, bánh mì chảo, bún chả cá và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều điểm du lịch sinh thái và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120363503_4528591020515690_2478571569557429226_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEkIo_RFgQGhpYweUwcUMitfFQ5eQEjWJB8VDl5ASNYkFtuNg_olKuMYoV_hQ6Zrnjm0WwXOsuihQQnVE4Z-mvN&_nc_ohc=iw-9-stT3YkAX8Qv2uQ&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfC8EUUD0le2-kgLfmUvq5Yx2GqgeudfwNiw-uTZAYhf0g&oe=66348EEA', 'VUNG007'),
('TINH059', 'Trà Vinh', 'Tỉnh Trà Vinh nằm ở miền Nam Việt Nam, là một trong những vùng đất có văn hóa dân tộc đa dạng và cảnh đẹp thiên nhiên hùng vĩ. Đặc sản của Trà Vinh bao gồm bánh xèo, bún mắm, bún chả cá và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều di tích lịch sử và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120539923_4528591333848992_6878034007648045151_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGbh7QCD2BK6YPivt0AFx2YmA_0eJ7QYTaYD_R4ntBhNqDyzBIaqk1PZf9eXzEh1QhbSvX0hryw2V_D9iZOcGeC&_nc_ohc=v4ewHK97ISgAX8T201s&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfAlID2OvNUvBY4rcJfl9go_LcN_RLyqQnH36X3MWyKlYw&oe=6634850F', 'VUNG007'),
('TINH060', 'Vĩnh Long', 'Tỉnh Vĩnh Long nằm ở miền Nam Việt Nam, là một trong những vùng đất nổi tiếng với nguồn tài nguyên thiên nhiên phong phú và văn hóa dân tộc đa dạng. Đặc sản của Vĩnh Long bao gồm bánh xèo, bánh mì chảo, bún chả cá và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều điểm du lịch sinh thái và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120221524_4528591247182334_6143356890867755699_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHDLA__5uzI1FkeTYS5D7RJuYeabnW-nj65h5pudb6ePukg96d_K8BrlkzykJNpaW99Mlj3a4_nfKKvVnHQpY-W&_nc_ohc=3uObg-XX2A0AX9W40LA&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfDrDsBLG2DCsUE11LgVCYBHpJPomDgNiCd3FC7Y51bTRg&oe=6634AAE5', 'VUNG007'),
('TINH061', 'Tiền Giang', 'Tỉnh Tiền Giang nằm ở miền Nam Việt Nam, là một trong những vùng đất nổi tiếng với nguồn tài nguyên thiên nhiên phong phú và văn hóa dân tộc đa dạng. Đặc sản của Tiền Giang bao gồm bánh xèo, bánh mì chảo, bún chả cá và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều điểm du lịch sinh thái và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/120195263_4528590683849057_7879618907437455788_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHrNApk_vB8AeynJgxkFgyCmgGuz-POJgyaAa7P484mDIurb8Y0Zi9MyqAHDvj5-SDBx6YLPFdep80Gf3s2onEY&_nc_ohc=tIk9G0A0o9EAX-Tir1j&_nc_ht=scontent.fsgn5-14.fna&oh=00_AfDLmICH-gpO6jfAfKx7UUl-inB2ySUAfdNeH-Pk0pw1WQ&oe=663496E5', 'VUNG007'),
('TINH062', 'Hậu Giang', 'Tỉnh Hậu Giang nằm ở miền Nam Việt Nam, là một trong những vùng đất nổi tiếng với nguồn tài nguyên thiên nhiên phong phú và văn hóa dân tộc đa dạng. Đặc sản của Hậu Giang bao gồm bánh xèo, bánh mì chảo, bún chả cá và các loại trái cây nhiệt đới. Ngoài ra, vùng này còn có nhiều điểm du lịch sinh thái và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/120195764_4528591517182307_277283127604772943_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGl0bfJuy-7I6xtZCmBhEMamiknJ_BOWICaKScn8E5YgCNXall12_x1lR4890he414e77hPrPBKog4Z7aveiqMr&_nc_ohc=D-l-V_QD3bYAX_6gNcf&_nc_ht=scontent.fsgn5-9.fna&oh=00_AfAbjfDxHivQs6j1hJ7lCS1T6EWD-v-Pya6na_E9AjnhAA&oe=6634AFB7', 'VUNG007'),
('TINH063', 'Cần Thơ', 'Thành phố Cần Thơ nằm ở miền Nam Việt Nam, là một trong những trung tâm kinh tế và văn hóa của vùng đồng bằng sông Cửu Long. Đặc sản của Cần Thơ bao gồm bánh mì, bún mắm, bánh tét và các loại trái cây nhiệt đới. Ngoài ra, thành phố này còn nổi tiếng với các điểm du lịch sinh thái và là nơi diễn ra nhiều sự kiện văn hóa và du lịch.', 'https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.6435-9/120367290_4528590937182365_6245034192979159310_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGdGnZizBue7WNn3UGPmfQsboxEJ8IVLVZujEQnwhUtVgAZPasq223PxjysdVbDiB12I2Rrs4Xwxr_gxpYde-pV&_nc_ohc=gTg5fcknkXkAX8u-UaU&_nc_ht=scontent.fsgn5-3.fna&oh=00_AfDh2clXzJNeMOL0sHHsDq5qn6ksAX1_L6oqkNWVrVy-og&oe=66348DF2', 'VUNG007');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Users`
--

CREATE TABLE `Users` (
  `IDUsers` char(7) NOT NULL,
  `Ten` varchar(50) DEFAULT NULL,
  `GioiTinh` varchar(10) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `IDTinh` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `Users`
--

INSERT INTO `Users` (`IDUsers`, `Ten`, `GioiTinh`, `Email`, `IDTinh`) VALUES
('USER001', 'Nguyen Hoàng Tuấn', 'Nam', 'hoangtuan@gmail.com', 'TINH001'),
('USER002', 'Lê Bùi Tấn Trưởng', 'Nữ', 'tantruong@gmail.com', 'TINH007'),
('USER003', 'Nguyễn Thành Đạt', 'Nam', 'thanhdat@gmail.com', 'TINH019'),
('USER004', 'Lê Hoài Dinh', 'Nam', 'hoaidinh@gmail.com', 'TINH032');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Vung`
--

CREATE TABLE `Vung` (
  `IDVung` char(7) NOT NULL,
  `TenVung` varchar(50) DEFAULT NULL,
  `Mien` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `Vung`
--

INSERT INTO `Vung` (`IDVung`, `TenVung`, `Mien`) VALUES
('VUNG001', 'Trung du miền núi phía Bắc', 'Bắc'),
('VUNG002', 'Đồng bằng sông Hồng và duyên hải Đông Bắc', 'Bắc'),
('VUNG003', 'Bắc Trung Bộ', 'Trung'),
('VUNG004', 'Duyên hải Nam Trung Bộ', 'Trung'),
('VUNG005', 'Tây Nguyên', 'Trung'),
('VUNG006', 'Đông Nam Bộ', 'Nam'),
('VUNG007', 'Tây Nam Bộ', 'Nam');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `Comment`
--
ALTER TABLE `Comment`
  ADD PRIMARY KEY (`IDDacSan`,`IDUsers`),
  ADD KEY `IDUsers` (`IDUsers`);

--
-- Chỉ mục cho bảng `DacSan`
--
ALTER TABLE `DacSan`
  ADD PRIMARY KEY (`IDDacSan`),
  ADD KEY `IDLoaiDS` (`IDLoaiDS`),
  ADD KEY `IDTinh` (`IDTinh`);

--
-- Chỉ mục cho bảng `DacSanLuu`
--
ALTER TABLE `DacSanLuu`
  ADD PRIMARY KEY (`IDDacSan`,`IDUsers`),
  ADD KEY `IDUsers` (`IDUsers`);

--
-- Chỉ mục cho bảng `Hinh_DacSan`
--
ALTER TABLE `Hinh_DacSan`
  ADD PRIMARY KEY (`IDHinh`),
  ADD KEY `IDDacSan` (`IDDacSan`);

--
-- Chỉ mục cho bảng `LoaiDacSan`
--
ALTER TABLE `LoaiDacSan`
  ADD PRIMARY KEY (`IDLoaiDS`);

--
-- Chỉ mục cho bảng `NoiBan`
--
ALTER TABLE `NoiBan`
  ADD PRIMARY KEY (`IDNoiBan`),
  ADD KEY `IDDacSan` (`IDDacSan`);

--
-- Chỉ mục cho bảng `Tinh`
--
ALTER TABLE `Tinh`
  ADD PRIMARY KEY (`IDTinh`),
  ADD KEY `IDVung` (`IDVung`);

--
-- Chỉ mục cho bảng `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`IDUsers`),
  ADD KEY `IDTinh` (`IDTinh`);

--
-- Chỉ mục cho bảng `Vung`
--
ALTER TABLE `Vung`
  ADD PRIMARY KEY (`IDVung`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `Comment`
--
ALTER TABLE `Comment`
  ADD CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`IDDacSan`) REFERENCES `DacSan` (`IDDacSan`),
  ADD CONSTRAINT `Comment_ibfk_2` FOREIGN KEY (`IDUsers`) REFERENCES `Users` (`IDUsers`);

--
-- Các ràng buộc cho bảng `DacSan`
--
ALTER TABLE `DacSan`
  ADD CONSTRAINT `DacSan_ibfk_1` FOREIGN KEY (`IDLoaiDS`) REFERENCES `LoaiDacSan` (`IDLoaiDS`),
  ADD CONSTRAINT `DacSan_ibfk_2` FOREIGN KEY (`IDTinh`) REFERENCES `Tinh` (`IDTinh`);

--
-- Các ràng buộc cho bảng `DacSanLuu`
--
ALTER TABLE `DacSanLuu`
  ADD CONSTRAINT `DacSanLuu_ibfk_1` FOREIGN KEY (`IDDacSan`) REFERENCES `DacSan` (`IDDacSan`),
  ADD CONSTRAINT `DacSanLuu_ibfk_2` FOREIGN KEY (`IDUsers`) REFERENCES `Users` (`IDUsers`);

--
-- Các ràng buộc cho bảng `Hinh_DacSan`
--
ALTER TABLE `Hinh_DacSan`
  ADD CONSTRAINT `Hinh_DacSan_ibfk_1` FOREIGN KEY (`IDDacSan`) REFERENCES `DacSan` (`IDDacSan`);

--
-- Các ràng buộc cho bảng `NoiBan`
--
ALTER TABLE `NoiBan`
  ADD CONSTRAINT `NoiBan_ibfk_1` FOREIGN KEY (`IDDacSan`) REFERENCES `DacSan` (`IDDacSan`);

--
-- Các ràng buộc cho bảng `Tinh`
--
ALTER TABLE `Tinh`
  ADD CONSTRAINT `Tinh_ibfk_1` FOREIGN KEY (`IDVung`) REFERENCES `Vung` (`IDVung`);

--
-- Các ràng buộc cho bảng `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`IDTinh`) REFERENCES `Tinh` (`IDTinh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
