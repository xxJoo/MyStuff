;|*********************************************************************************************
;软件作者: Highflybird                                                                          
;软件用途: 为AutoCAD 的LISP定制的一些算法和函数                                                 
;日期地点: 2012.12.12 深圳                                                                      
;程序语言: AutoLISP,Visual LISP								       
;版本号:   Ver. 1.0.121212								       
;
;===============================================================================================
;本软件为开源软件: 以下是开源申明:                                   			        
;-----------------------------------------------------------------------------------------------
;本页面的软件遵照GPL协议开放源代码，您可以自由传播和修改，在遵照下面的约束条件的前提下:  	
;												
;一. 只要你在本开源软件的每一副本上明显和恰当地出版版权声明，保持此许可证的声明和没有担保的声明完
;整无损，并和程序一起给每个其他的程序接受者一份许可证的副本，你就可以用任何媒体复制和发布你收到的
;原始的程序的源代码。你也可以为转让副本的实际行动收取一定费用，但必须事先得到的同意。		
;									        		
;二. 你可以修改本开源软件的一个或几个副本或程序的任何部分，以此形成基于程序的作品。只要你同时满足
;下面的所有条件，你就可以按前面第一款的要求复制和发布这一经过修改的程序或作品。  		
;1.你必须在修改的文件中附有明确的说明: 你修改了这一文件及具体的修改日期。			
;2.你必须使你发布或出版的作品（它包含程序的全部或一部分，或包含由程序的全部或部分衍生的作品）允许
;  第三方作为整体按许可证条款免费使用。								
;3.如果修改的程序在运行时以交互方式读取命令，你必须使它在开始进入常规的交互使用方式时打印或显示声
;  明: 包括适当的版权声明和没有担保的声明（或者你提供担保的声明）；用户可以按此许可证条款重新发布
;  程序的说明；并告诉用户如何看到这一许可证的副本。（例外的情况: 如果原始程序以交互方式工作，它并
;  不打印这样的声明，你的基于程序的作品也就不用打印声明。			                
;												
;三. 只要你遵循一、二条款规定，您就可以自由使用并传播本源代码，但必须原封不动地保留原作者信息。  
;===============================================================================================
;
;**********************************************************************************************|
;

;;;***********************************************************;;
;;; 矩阵部分                                                  ;;
;;;***********************************************************;;

;;;-----------------------------------------------------------;;
;;; 两向量相加 addition                                       ;;
;;; Input: v1,v2 -vectors in R^n                              ;;
;;; OutPut: A vector                                          ;;
;;;-----------------------------------------------------------;;
(defun MAT:v+v (v1 v2)
  (mapcar '+ v1 v2)
)

;;;-----------------------------------------------------------;;
;;; 两向量相减  subtraction                                   ;;
;;; Input: v1,v2 -vectors in R^n                              ;;
;;; OutPut: A vector                                          ;;
;;;-----------------------------------------------------------;;
(defun MAT:v-v (v1 v2)
  (mapcar '- v1 v2)
)

;;;-----------------------------------------------------------;;
;;; 两向量相乘  multiplication                                ;;
;;; Input: v1,v2 -vectors in R^n                              ;;
;;; OutPut: A vector                                          ;;
;;;-----------------------------------------------------------;;
(defun MAT:v*v (v1 v2)
  (mapcar '* v1 v2)
)

;;;-----------------------------------------------------------;;
;;; 两向量相除  division                                      ;;
;;; Input: v1,v2 -vectors in R^n                              ;;
;;; OutPut: A vector                                          ;;
;;;-----------------------------------------------------------;;
(defun MAT:v/v (v1 v2)
  (mapcar '/ v1 v2)
)

;;;-----------------------------------------------------------;;
;;; 向量乘标量(系数)				              ;;
;;; Vector x Scalar - Lee Mac			              ;;
;;; Args: v - vector in R^n, s - real scalar	              ;;
;;;-----------------------------------------------------------;;
(defun MAT:vxs (v s)
  (mapcar (function (lambda (n) (* n s))) v)
)

;;;-----------------------------------------------------------;;
;;; 两向量的点积                                              ;;
;;; Vector Dot Product                                        ;;
;;; Input: v1,v2 -vectors in R^n                              ;;
;;;-----------------------------------------------------------;;
(defun MAT:Dot (v1 v2)
  (apply '+ (mapcar '* v1 v2))
)

;;;-----------------------------------------------------------;;
;;; 两向量的叉积                                              ;;
;;; Vector Cross Product 		                      ;;
;;; Args: u,v - vectors in R^3			              ;;
;;;-----------------------------------------------------------;;
(defun MAT:vxv (u v)
  (list
    (- (* (cadr u) (caddr v)) (* (cadr v) (caddr u)))
    (- (* (car v) (caddr u)) (* (car u) (caddr v)))
    (- (* (car u) (cadr v)) (* (car v) (cadr u)))
  )
)

;;;-----------------------------------------------------------;;
;;; 线性组合  标量组乘向量组                                  ;;
;;; Linear combination - highflybird                          ;;
;;; Input: Vectors - vectors, Scalars, - a real number list   ;;
;;; Output: a vector                                          ;;
;;;-----------------------------------------------------------;;
(defun MAT:SxVs	(Vectors Scalars)
  (apply 'mapcar (cons '+ (mapcar 'MAT:vxs Vectors Scalars)))
)

;;;-----------------------------------------------------------;;
;;; 向量的模(长度)				              ;;
;;; Vector Norm - Lee Mac			       	      ;;
;;; Args: v - vector in R^n			              ;;
;;;-----------------------------------------------------------;;
(defun MAT:norm	(v)
  (sqrt (apply '+ (mapcar '* v v)))
)

;;;-----------------------------------------------------------;;
;;; 向量的模(长度)				              ;;
;;; Vector Norm - highflybird			              ;;
;;; Args: v - vector in R^3			              ;;
;;;-----------------------------------------------------------;;
(defun MAT:Norm3D (v)
  (distance '(0 0 0) v)
)

;;;-----------------------------------------------------------;;
;;; 单位向量						      ;;
;;; Unit Vector - Lee Mac                                     ;;
;;; Args: v - vector in R^n				      ;;
;;;-----------------------------------------------------------;;
(defun MAT:Unitization (v)
  ((lambda (n)
     (if (equal 0.0 n 1e-14)
       nil
       (MAT:vxs v (/ 1.0 n))
     )
   )
    (MAT:norm v)
  )
)

;;;-----------------------------------------------------------;;
;;; 单位向量					              ;;
;;; Unit Vector - highflybird                                 ;;
;;; Args: v - vector in R^3			              ;;
;;;-----------------------------------------------------------;;
(defun MAT:unit	(v / l)
  (cond
    ((= (setq l (MAT:Norm3D v)) 1.0) v)
    ((> l 1e-14) (MAT:vxs v (/ 1.0 l)))
  )
)

;;;-----------------------------------------------------------;;
;;; 2d行列式 determinant in R^2                               ;;
;;; Args: 4 numbers    			                      ;;
;;;-----------------------------------------------------------;;
(defun MAT:Det2	(x1 y1 x2 y2)
  (- (* x1 y2) (* x2 y1))
)

;;;-----------------------------------------------------------;;
;;; 3d行列式  determinant in R^3                              ;;
;;; Args: 9 numbers    			                      ;;
;;;-----------------------------------------------------------;;
(defun MAT:Det3	(a1 b1 c1 a2 b2 c2 a3 b3 c3)
  (+ (* a1 (- (* b2 c3) (* b3 c2)))
     (* a2 (- (* b3 c1) (* b1 c3)))
     (* a3 (- (* b1 c2) (* b2 c1)))
  )
)

;;;-----------------------------------------------------------;;
;;; 两个2d向量的叉积的数值                                    ;;
;;; 输入: 两个点（或者两个向量）                              ;;
;;; 输出: 一个数值.如果为正则是逆时针,两向量形成的平面法线向量;;
;;;       向上，为负则是顺时针，为零则两向量共线或平行。      ;;
;;;       这个数值也为原点,P1,P2三点面积的两倍。              ;;
;;;-----------------------------------------------------------;;
(defun MAT:Det2V (v1 v2)
  (- (* (car v1) (cadr v2)) (* (car v2) (cadr v1)))
)

;;;-----------------------------------------------------------;;
;;; 旋转一个向量或者点90度                                    ;;
;;; 输入: 一个向量                                            ;;
;;; 输出: 被旋转90度后的向量                                  ;;
;;;-----------------------------------------------------------;;
(defun MAT:Rot90 (vec)
  (vl-list* (- (cadr vec)) (car vec) (cddr vec))
)

;;;-----------------------------------------------------------;;
;;; 旋转向量到指定角度                                        ;;
;;; 输入: 一个向量和指定的角度                                ;;
;;; 输出: 被旋转后的向量                                      ;;
;;;-----------------------------------------------------------;;
(defun MAT:Rot2D (v a / c s x y)
  (setq	c (cos a)
	s (sin a)
  )
  (setq	x (car v)
	y (cadr v)
  )
  (list (- (* x c) (* y s)) (+ (* x s) (* y c)))
)

;;;-----------------------------------------------------------;;
;;; 矩阵转置                                                  ;;
;;; MAT:trp Transpose a matrix -Doug Wilson-                  ;;
;;; 输入：矩阵                                                ;;
;;; 输出：转置后的矩阵                                        ;;
;;;-----------------------------------------------------------;;
(defun MAT:trp (m)
  (apply 'mapcar (cons 'list m))
)

;;;-----------------------------------------------------------;;
;;; 矩阵相加                                                  ;;
;;; Matrix + Matrix - Lee Mac                                 ;;
;;; Args: m,n - nxn matrices                                  ;;
;;;-----------------------------------------------------------;;
(defun MAT:m+m (m n)
  (mapcar '(lambda (r s) (mapcar '+ r s)) m n)
)

;;;-----------------------------------------------------------;;
;;; 矩阵相减                                                  ;;
;;; Matrix - Matrix - Lee Mac                                 ;;
;;; Args: m,n - nxn matrices                                  ;;
;;;-----------------------------------------------------------;;
(defun MAT:m-m (m n)
  (mapcar '(lambda (r s) (mapcar '- r s)) m n)
)

;;;-----------------------------------------------------------;;
;;; 矩阵相乘                                                  ;;
;;; MAT:mxm Multiply two matrices -Vladimir Nesterovsky-      ;;
;;;-----------------------------------------------------------;;
(defun MAT:mxm (m q)
  (mapcar (function (lambda (r) (MAT:mxv (MAT:trp q) r))) m)
)

;;;-----------------------------------------------------------;;
;;; 向量或点的矩阵变换(向量乘矩阵)                            ;;
;;; Matrix x Vector - Vladimir Nesterovsky                    ;;
;;; Args: m - nxn matrix, v - vector in R^n                   ;;
;;;-----------------------------------------------------------;;
(defun MAT:mxv (m v)
  (mapcar (function (lambda (r) (apply '+ (mapcar '* r v))))
	  m
  )
)

;;;-----------------------------------------------------------;;
;;; 点的矩阵(4x4 matrix) 变换                                 ;;
;;; 输入：矩阵m和一个三维点p                                  ;;
;;; 输出：点变换后的位置                                      ;;
;;;-----------------------------------------------------------;;
(defun MAT:mxp (m p)
  (reverse (cdr (reverse (MAT:mxv m (append p '(1.0))))))
)

;;;-----------------------------------------------------------;;
;;; 矩阵乘标量                                                ;;
;;; Matrix x Scalar - Lee Mac                                 ;;
;;; Args: m - nxn matrix, n - real scalar                     ;;
;;;-----------------------------------------------------------;;
(defun MAT:mxs (m s)
  (mapcar (function (lambda (v) (MAT:VxS v s))) m)
)


;;;***********************************************************;;
;;;矩阵之变换部分                                             ;;
;;;***********************************************************;;

;;;-----------------------------------------------------------;;
;;; 平移变换矩阵方式1					      ;;
;;; 参数:						      ;;
;;; v - 位移矢量                                              ;;
;;;-----------------------------------------------------------;;
;;;---------------=={ Translate by Matrix }==-----------------;;
;;;                                                           ;;
;;; Translation Matrix                                        ;;
;;;-----------------------------------------------------------;;
;;; Author: highflybird, Copyright ? 2012                     ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; v  - Displacement vector by which to translate            ;;
;;;-----------------------------------------------------------;;
(defun MAT:Translation (v)
  (list
    (list 1. 0. 0. (car v))
    (list 0. 1. 0. (cadr v))
    (list 0. 0. 1. (caddr v))
    (list 0. 0. 0. 1.)
  )
)

;;;-----------------------------------------------------------;;
;;; 平移变换矩阵方式2					      ;;
;;; 参数:						      ;;
;;; p1 - 基点                                                 ;;
;;; p2 - 目标点                                               ;;
;;;-----------------------------------------------------------;;
;;;---------------=={ Translate by Matrix }==-----------------;;
;;;                                                           ;;
;;; Translation Matrix                                        ;;
;;;-----------------------------------------------------------;;
;;; Author: highflybird, Copyright ? 2012                     ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; p1, p2 - Points representing vector by which to translate ;;
;;;-----------------------------------------------------------;;
(defun MAT:TranslateBy2P (p1 p2)
  (MAT:Translation (mapcar '- p2 p1))
)

;;;-----------------------------------------------------------;;
;;; 比例缩放矩阵					      ;;
;;; 参数:						      ;;
;;; Cen   - 基点                                              ;;
;;; scale - 缩放比例                                          ;;
;;;-----------------------------------------------------------;;
;;;-----------------=={ Scale by Matrix }==-------------------;;
;;;                                                           ;;
;;; Scaling Matrix                                            ;;
;;;-----------------------------------------------------------;;
;;; Author: highflybird, Copyright ? 2012                     ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; Cen    - Base Point for Scaling Transformation            ;;
;;; scale  - Scale Factor by which to scale object            ;;
;;;-----------------------------------------------------------;;
(defun MAT:Scaling (Cen scale / s)
  (setq s (- 1 scale))
  (list
    (list scale 0. 0. (* s (car Cen)))
    (list 0. scale 0. (* s (cadr Cen)))
    (list 0. 0. scale (* s (caddr Cen)))
    '(0. 0. 0. 1.)
  )
)

;;;-----------------------------------------------------------;;
;;; 二维旋转变换矩阵					      ;;
;;; 参数:						      ;;
;;; Cen - 基点                                                ;;
;;; ang - 旋转角度                                            ;;
;;;-----------------------------------------------------------;;
;;;-----------------=={ Rotate by Matrix }==------------------;;
;;;                                                           ;;
;;; Rotation Matrix                                           ;;
;;;-----------------------------------------------------------;;
;;; Author: highflybird, Copyright ? 2012                     ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; Cen    - Base Point for Rotation Transformation           ;;
;;; ang    - Angle through which to rotate object             ;;
;;;-----------------------------------------------------------;;
(defun MAT:Rotation (Cen ang / c s x y)
  (setq	c (cos ang)
	s (sin ang)
  )
  (setq	x (car Cen)
	y (cadr Cen)
  )
  (list
    (list c (- s) 0. (- x (- (* c x) (* s y))))
    (list s c 0. (- y (+ (* s x) (* c y))))
    '(0. 0. 1. 0.)
    '(0. 0. 0. 1.)
  )
)

;;;-----------------------------------------------------------;;
;;; 三维旋转变换矩阵					      ;;
;;; 参数:						      ;;
;;; Cen  - 基点                                               ;;
;;; Axis - 旋转轴                                             ;;
;;; ang  - 旋转角                                             ;;
;;;-----------------------------------------------------------;;
;;;---------------=={ 3D Rotate by Matrix }==-----------------;;
;;; Author: highflybird.				      ;;
;;; Arguments:                                                ;;
;;; Cen ---Input origin point of rotation	              ;;
;;; Axis---Input axis vector of rotation 		      ;;
;;; Ang ---Input angle of rotation			      ;;
;;;-----------------------------------------------------------;;
(defun MAT:Rotation3D (Cen Axis Ang / A B C D M N P x y z)
  (setq D (distance '(0 0 0) Axis))
  (if (or (< D 1e-8) (zerop ang))
    '((1. 0. 0. 0.) (0. 1. 0. 0.) (0. 0. 1. 0.) (0. 0. 0. 1.))
    (setq N (mapcar '/ Axis (list D D D))
	  x (car N)
	  y (cadr N)
	  z (caddr N)
	  A (cos Ang)
	  B (sin Ang)
	  C (- 1 A)
	  M (list (list	(+ A (* x x C))
			(- (* x y C) (* z B))
			(+ (* y B) (* x z C))
		  )
		  (list	(+ (* z B) (* x y C))
			(+ A (* y y C))
			(- (* y z C) (* x B))
		  )
		  (list	(- (* x z C) (* y B))
			(+ (* x B) (* y z C))
			(+ A (* z z C))
		  )
	    )
	  p (mapcar '- Cen (Mat:mxv M Cen))
	  M (Mat:DispToMatrix M p)
    )
  )
)

;;;-----------------------------------------------------------;;
;;; 三维旋转变换矩阵（通过两点和旋转角）		      ;;
;;; 参数:						      ;;
;;; p1,p2  - 两点定义的旋转轴                                 ;;
;;; ang    - 旋转角度                                         ;;
;;;-----------------------------------------------------------;;
;;;---------------=={ 3D Rotate by Matrix }==-----------------;;
;;; Rotation matrix                                           ;;
;;;-----------------------------------------------------------;;
;;; Author: highflybird, Copyright ? 2012                     ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; p1,p2  - Two 3D points defining the axis of rotation      ;;
;;; ang    - Rotation Angle                                   ;;
;;;-----------------------------------------------------------;;
(defun MAT:RotateBy2P (p1 p2 ang)
  (MAT:Rotation3D P1 (mapcar '- p2 p1) ang)
)

;;;-----------------------------------------------------------;;
;;; 二维镜像变换矩阵					      ;;
;;; 参数:						      ;;
;;; p1     - 镜像向量第一点                                   ;;
;;; p2     - 镜像向量第二点                                   ;;
;;;-----------------------------------------------------------;;
;;;----------------=={ Reflect by Matrix }==------------------;;
;;;                                                           ;;
;;; Reflects a VLA-Object or Point List using a               ;;
;;; Transformation Matrix                                     ;;
;;;-----------------------------------------------------------;;
;;; Author: Lee Mac, Copyright ? 2010 - www.lee-mac.com       ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; target - VLA-Object or Point List to transform            ;;
;;; p1, p2 - Points representing vector in which to reflect   ;;
;;;-----------------------------------------------------------;;
(defun MAT:Reflect (p1 p2 / a c s x y)
  (setq	a (angle p1 p2)
	a (+ a a)
  )
  (setq	c (cos a)
	s (sin a)
  )
  (setq	x (car p1)
	y (cadr p1)
  )
  (list
    (list c s 0. (- x (+ (* c x) (* s y))))
    (list s (- c) 0. (- y (- (* s x) (* c y))))
    '(0. 0. 1. 0.)
    '(0. 0. 0. 1.)
  )
)

;;;-----------------------------------------------------------;;
;;; 三维镜像变换矩阵					      ;;
;;; 参数:						      ;;
;;; p1,p2,p3 - 三点定义的镜像平面                             ;;
;;;-----------------------------------------------------------;;
;;;---------------=={ 3D Reflect by Matrix }==----------------;;
;;;                                                           ;;
;;; Reflection matrix   				      ;;
;;;-----------------------------------------------------------;;
;;; Author: highflybird, Copyright ? 2012-                    ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; p1,p2,p3 - Three 3D points defining the reflection plane  ;;
;;;-----------------------------------------------------------;;
(defun MAT:Reflect3D (p1 p2 p3 / m ux uy uz)
  (mapcar
    'set
    '(ux uy uz)
    (MAT:unit (MAT:vxv (mapcar '- p2 p1) (mapcar '- p3 p1)))
  )
  (setq	m (list	(list (- 1. (* 2. ux ux)) (* -2. uy ux) (* -2. ux uz))
		(list (* -2. ux uy) (- 1. (* 2. uy uy)) (* -2. uy uz))
		(list (* -2. ux uz) (* -2. uy uz) (- 1. (* 2. uz uz)))
	  )
  )
  (Mat:DispToMatrix m (mapcar '- p1 (MAT:mxv m p1)))
)

;;;***********************************************************;;
;;; 以下部分来自Lee-Mac,特地致谢!                             ;;
;;;***********************************************************;;

;;;---------------=={      二维变换       }==-----------------;;
;;;-----------------------------------------------------------;;

;;;-----------------------------------------------------------;;
;;; 比例缩放矩阵					      ;;
;;; 参数:						      ;;
;;; target - vla-object 或者点                                ;;
;;; p1     - 基点                                             ;;
;;; scale  - 缩放比例                                         ;;
;;;-----------------------------------------------------------;;
;;;-----------------=={ Scale by Matrix }==-------------------;;
;;;                                                           ;;
;;; Scales a VLA-Object or Point List using a                 ;;
;;; Transformation Matrix                                     ;;
;;;-----------------------------------------------------------;;
;;; Author: Lee Mac, Copyright ? 2010 - www.lee-mac.com       ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; target - VLA-Object or Point List to transform            ;;
;;; p1     - Base Point for Scaling Transformation            ;;
;;; scale  - Scale Factor by which to scale object            ;;
;;;-----------------------------------------------------------;;
(defun LM:ScaleByMatrix	(target p1 scale / m)
  (LM:ApplyMatrixTransformation
    target
    (setq m
	   (list
	     (list scale 0. 0.)
	     (list 0. scale 0.)
	     (list 0. 0. scale)
	   )
    )
    (mapcar '- p1 (MAT:mxv m p1))
  )
)

;;;-----------------------------------------------------------;;
;;; 平移变换矩阵					      ;;
;;; 参数:						      ;;
;;; target - vla-object 或者点                                ;;
;;; p1     - 基点                                             ;;
;;; p2     - 目标点                                           ;;
;;;-----------------------------------------------------------;;
;;;---------------=={ Translate by Matrix }==-----------------;;
;;;                                                           ;;
;;; Translates a VLA-Object or Point List using a             ;;
;;; Transformation Matrix                                     ;;
;;;-----------------------------------------------------------;;
;;; Author: Lee Mac, Copyright ? 2010 - www.lee-mac.com       ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; target - VLA-Object or Point List to transform            ;;
;;; p1, p2 - Points representing vector by which to translate ;;
;;;-----------------------------------------------------------;;
(defun LM:TranslateByMatrix (target p1 p2)
  (LM:ApplyMatrixTransformation
    target
    (list
      (list 1. 0. 0.)
      (list 0. 1. 0.)
      (list 0. 0. 1.)
    )
    (mapcar '- p2 p1)
  )
)

;;;-----------------------------------------------------------;;
;;; 旋转变换矩阵					      ;;
;;; 参数:						      ;;
;;; target - vla-object 或者点                                ;;
;;; p1     - 基点                                             ;;
;;; ang    - 旋转角度                                         ;;
;;;-----------------------------------------------------------;;
;;;-----------------=={ Rotate by Matrix }==------------------;;
;;;                                                           ;;
;;; Rotates a VLA-Object or Point List using a                ;;
;;; Transformation Matrix                                     ;;
;;;-----------------------------------------------------------;;
;;; Author: Lee Mac, Copyright ? 2010 - www.lee-mac.com       ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; target - VLA-Object or Point List to transform            ;;
;;; p1     - Base Point for Rotation Transformation           ;;
;;; ang    - Angle through which to rotate object             ;;
;;;-----------------------------------------------------------;;
(defun LM:RotateByMatrix (target p1 ang / m)
  (LM:ApplyMatrixTransformation
    target
    (setq m
	   (list
	     (list (cos ang) (- (sin ang)) 0.)
	     (list (sin ang) (cos ang) 0.)
	     (list 0. 0. 1.)
	   )
    )
    (mapcar '- p1 (MAT:mxv m p1))
  )
)

;;;-----------------------------------------------------------;;
;;; 镜像变换矩阵					      ;;
;;; 参数:						      ;;
;;; target - vla-object 或者点                                ;;
;;; p1     - 镜像向量第一点                                   ;;
;;; p2     - 镜像向量第二点                                   ;;
;;;-----------------------------------------------------------;;
;;;----------------=={ Reflect by Matrix }==------------------;;
;;;                                                           ;;
;;; Reflects a VLA-Object or Point List using a               ;;
;;; Transformation Matrix                                     ;;
;;;-----------------------------------------------------------;;
;;; Author: Lee Mac, Copyright ? 2010 - www.lee-mac.com       ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; target - VLA-Object or Point List to transform            ;;
;;; p1, p2 - Points representing vector in which to reflect   ;;
;;;-----------------------------------------------------------;;
(defun LM:ReflectByMatrix (target p1 p2 / m)
  (
   (lambda (a / m)
     (LM:ApplyMatrixTransformation
       target
       (setq m
	      (list
		(list (cos a) (sin a) 0.)
		(list (sin a) (- (cos a)) 0.)
		(list 0. 0. 1.)
	      )
       )
       (mapcar '- p1 (MAT:mxv m p1))
     )
   )
    (* 2. (angle p1 p2))
  )
)

;;;-----------------------------------------------------------;;
;;; 变换函数					              ;;
;;; 参数:						      ;;
;;; target - vla-object 或者点                                ;;
;;; matrix - 3x3 矩阵                                         ;;
;;; vector - 移动向量                                         ;;
;;;-----------------------------------------------------------;;
;;;----------=={ Apply Matrix Transformation }==--------------;;
;;;                                                           ;;
;;; Transforms a VLA-Object or Point List using a             ;;
;;; Transformation Matrix                                     ;;
;;;-----------------------------------------------------------;;
;;; Author: Lee Mac, Copyright ? 2010 - www.lee-mac.com       ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; target - VLA-Object or Point List to Transform            ;;
;;; matrix - 3x3 Matrix by which to Transform object          ;;
;;; vector - 3D translation vector                            ;;
;;;-----------------------------------------------------------;;
(defun LM:ApplyMatrixTransformation (target matrix vector)
  (cond
    ((eq 'VLA-OBJECT (type target))

     (vla-TransformBy
       target
       (vlax-tMatrix
	 (append (mapcar (function (lambda (x v) (append x (list v))))
			 matrix
			 vector
		 )
		 '((0. 0. 0. 1.))
	 )
       )
     )
    )
    ((listp target)

     (mapcar
       (function
	 (lambda (point) (mapcar '+ (MAT:mxv matrix point) vector))
       )
       target
     )
    )
  )
)

;;;---------------=={      三维变换       }==-----------------;;
;;;-----------------------------------------------------------;;

;;;-----------------------------------------------------------;;
;;; 三维旋转变换矩阵					      ;;
;;; 参数:						      ;;
;;; target - vla-object 或者点                                ;;
;;; p1,p2  - 两点定义的旋转轴                                 ;;
;;; ang    - 旋转角度                                         ;;
;;;-----------------------------------------------------------;;
;;;---------------=={ 3D Rotate by Matrix }==-----------------;;
;;;                                                           ;;
;;; Rotates a VLA-Object or Point List about a 3D axis using  ;;
;;; a Transformation matrix.                                  ;;
;;;-----------------------------------------------------------;;
;;; Author: Lee Mac, Copyright ? 2011 - www.lee-mac.com       ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; target - VLA-Object or Point List to Rotate               ;;
;;; p1,p2  - Two 3D points defining the axis of rotation      ;;
;;; ang    - Rotation Angle                                   ;;
;;;-----------------------------------------------------------;;
(defun LM:Rotate3D (target p1 p2 ang / ux uy uz u m)
  (mapcar 'set
	  '(ux uy uz)
	  (setq u (MAT:unit (mapcar '- p2 p1)))
  )
  (LM:ApplyMatrixTransformation
    target
    (setq m
	   (MAT:m+m
	     (list
	       (list (cos ang) 0. 0.)
	       (list 0. (cos ang) 0.)
	       (list 0. 0. (cos ang))
	     )
	     (MAT:m+m
	       (MAT:mxs
		 (list
		   (list 0. (- uz) uy)
		   (list uz 0. (- ux))
		   (list (- uy) ux 0.)
		 )
		 (sin ang)
	       )
	       (MAT:mxs	(mapcar (function (lambda (e) (MAT:vxs u e))) u)
			(- 1. (cos ang))
	       )
	     )
	   )
    )
    (mapcar '- p1 (MAT:mxv m p1))
  )
)

;;;-----------------------------------------------------------;;
;;; 三维镜像变换矩阵					      ;;
;;; 参数:						      ;;
;;; target   - vla-object 或者点                              ;;
;;; p1,p2,p3 - 三点定义的镜像平面                             ;;
;;;-----------------------------------------------------------;;
;;;---------------=={ 3D Reflect by Matrix }==----------------;;
;;;                                                           ;;
;;; Reflects a VLA-Object or Point List in a plane using a    ;;
;;; Transformation matrix.                                    ;;
;;;-----------------------------------------------------------;;
;;; Author: Lee Mac, Copyright ? 2011 - www.lee-mac.com       ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; target   - VLA-Object or Point List to Reflect            ;;
;;; p1,p2,p3 - Three 3D points defining the reflection plane  ;;
;;;-----------------------------------------------------------;;
(defun LM:Reflect3D (target p1 p2 p3 / m u ux uy uz)
  (mapcar 'set
	  '(ux uy uz)
	  (setq u (MAT:unit (MAT:vxv (mapcar '- p2 p1) (mapcar '- p3 p1))))
  )
  (LM:ApplyMatrixTransformation
    target
    (setq m
	   (list
	     (list (- 1. (* 2. ux ux)) (* -2. uy ux) (* -2. ux uz))
	     (list (* -2. ux uy) (- 1. (* 2. uy uy)) (* -2. uy uz))
	     (list (* -2. ux uz) (* -2. uy uz) (- 1. (* 2. uz uz)))
	   )
    )
    (mapcar '- p1 (MAT:mxv m p1))
  )
)

;;;-----------------------------------------------------------;;
;;; 变换函数					              ;;
;;; 参数:						      ;;
;;; target - vla-object 或者点                                ;;
;;; matrix - 3x3 矩阵                                         ;;
;;; vector - 移动向量                                         ;;
;;;-----------------------------------------------------------;;
;;;----------=={ Apply Matrix Transformation }==--------------;;
;;;                                                           ;;
;;; Transforms a VLA-Object or Point List using a             ;;
;;; Transformation Matrix                                     ;;
;;;-----------------------------------------------------------;;
;;; Author: Lee Mac, Copyright ? 2010 - www.lee-mac.com       ;;
;;;-----------------------------------------------------------;;
;;; Arguments:                                                ;;
;;; target - VLA-Object or Point List to Transform            ;;
;;; matrix - 3x3 Matrix by which to Transform object          ;;
;;; vector - 3D translation vector                            ;;
;;;-----------------------------------------------------------;;
(defun LM:ApplyMatrixTransformation (target matrix vector)
  (cond
    ((eq 'VLA-OBJECT (type target))

     (vla-TransformBy
       target
       (vlax-tMatrix
	 (append (mapcar (function (lambda (x v) (append x (list v))))
			 matrix
			 vector
		 )
		 '((0. 0. 0. 1.))
	 )
       )
     )
    )
    ((listp target)

     (mapcar
       (function
	 (lambda (point) (mapcar '+ (MAT:mxv matrix point) vector))
       )
       target
     )
    )
  )
)

;;;-----------------------------------------------------------;;
;;; 块参照的变换矩阵和逆矩阵				      ;;
;;;-----------------------------------------------------------;;

;;;-----------------------------------------------------------;;
;;; 功能： 某点在块内坐标系统和世界或者用户坐标系统的转换     ;;
;;; 参数： pt 要变换的点。                                    ;;
;;;        rlst 用 nentselp或者nentsel得到的表的最后一项      ;;
;;;        from  坐标系：0,WCS; 1,当前UCS; 2,块参照坐标系RCS  ;;
;;;        to    坐标系：0,WCS; 1,当前UCS; 2,块参照坐标系RCS  ;;
;;;-----------------------------------------------------------;;
;;; MAT:TransNested (gile)                                    ;;
;;; Translates a point coordinates from WCS or UCS to RCS     ;;
;;; -coordinates system of a				      ;;
;;; reference (xref or block) whatever its nested level-      ;;
;;;							      ;;
;;; Arguments						      ;;
;;; pt : the point to translate				      ;;
;;; rlst : the parents entities list from the deepest nested  ;;
;;;        to the one inserted in current space -same as      ;;
;;;        (last (nentsel)) or (last (nentselp))	      ;;
;;; from to : as with trans function: 0.WCS, 1.UCS, 2.RCS     ;;
;;;-----------------------------------------------------------;;

(defun MAT:TransNested (pt rlst from to / GEOM)
  (and (= 1 from) (setq pt (trans pt 1 0)))
  (and (= 2 to) (setq rlst (reverse rlst)))
  (and (or (= 2 from) (= 2 to))
       (while rlst
	 (setq geom (if	(= 2 to)
		      (MAT:RevRefGeom (car rlst))
		      (MAT:RefGeom (car rlst))
		    )
	       rlst (cdr rlst)
	       pt   (mapcar '+ (MAT:mxv (car geom) pt) (cadr geom))
	 )
       )
  )
  (if (= 1 to)
    (trans pt 0 1)
    pt
  )
)

;;;-----------------------------------------------------------;;
;;; 功能：图块的变换矩阵                                      ;;
;;; 输入：块参照的图元名                                      ;;
;;; 输出：块参照的变换矩阵                                    ;;
;;;-----------------------------------------------------------;;
;;; MAT:RefGeom (gile)					      ;;
;;; Returns a list which first item is a 3x3 transformation   ;;
;;; matrix(rotation,scales normal) and second item the object ;;
;;; insertion point in its parent(xref, bloc or space)	      ;;
;;;							      ;;
;;; Argument : an ename					      ;;
;;;-----------------------------------------------------------;;

(defun MAT:RefGeom (ename / elst ang norm mat)
  (setq	elst (entget ename)
	ang  (cdr (assoc 50 elst))
	norm (cdr (assoc 210 elst))
  )
  (list
    (setq mat
	   (MAT:mxm
	     (mapcar (function (lambda (v) (trans v 0 norm T)))
		     '((1.0 0.0 0.0) (0.0 1.0 0.0) (0.0 0.0 1.0))
	     )
	     (MAT:mxm
	       (list (list (cos ang) (- (sin ang)) 0.0)
		     (list (sin ang) (cos ang) 0.0)
		     '(0.0 0.0 1.0)
	       )
	       (list (list (cdr (assoc 41 elst)) 0.0 0.0)
		     (list 0.0 (cdr (assoc 42 elst)) 0.0)
		     (list 0.0 0.0 (cdr (assoc 43 elst)))
	       )
	     )
	   )
    )
    (mapcar
      '-
      (trans (cdr (assoc 10 elst)) norm 0)
      (MAT:mxv mat
	       (cdr (assoc 10 (tblsearch "BLOCK" (cdr (assoc 2 elst)))))
      )
    )
  )
)

;;;-----------------------------------------------------------;;
;;; 功能：图块的变换矩阵的逆矩阵                              ;;
;;;-----------------------------------------------------------;;
;;; MAT:RevRefGeom (gile)				      ;;
;;; MAT:RefGeom inverse function			      ;;
;;; 输入：块参照的图元名                                      ;;
;;; 输出：块参照的变换矩阵的逆矩阵                            ;;
;;;-----------------------------------------------------------;;
(defun MAT:RevRefGeom (ename / entData ang norm mat)
  (setq	entData	(entget ename)
	ang	(- (cdr (assoc 50 entData)))
	norm	(cdr (assoc 210 entData))
  )
  (list
    (setq mat
	   (MAT:mxm
	     (list (list (/ 1 (cdr (assoc 41 entData))) 0.0 0.0)
		   (list 0.0 (/ 1 (cdr (assoc 42 entData))) 0.0)
		   (list 0.0 0.0 (/ 1 (cdr (assoc 43 entData))))
	     )
	     (MAT:mxm
	       (list (list (cos ang) (- (sin ang)) 0.0)
		     (list (sin ang) (cos ang) 0.0)
		     '(0.0 0.0 1.0)
	       )
	       (mapcar (function (lambda (v) (trans v norm 0 T)))
		       '((1.0 0.0 0.0) (0.0 1.0 0.0) (0.0 0.0 1.0))
	       )
	     )
	   )
    )
    (mapcar '-
	    (cdr (assoc 10 (tblsearch "BLOCK" (cdr (assoc 2 entData)))))
	    (MAT:mxv mat (trans (cdr (assoc 10 entData)) norm 0))
    )
  )
)

;;;-----------------------------------------------------------;;
;;; 属性的变换矩阵Attrib Transformation Matrix.	-highflybird  ;;
;;; 输入：Ename 属性的图元名                                  ;;
;;; 输出：属性的变换矩阵                                      ;;
;;;-----------------------------------------------------------;;
(defun MAT:AttGeom (ename / ang norm mat elst)
  (setq	elst (entget ename)
	ang  (cdr (assoc 50 elst))
	norm (cdr (assoc 210 elst))
  )
  (list
    (setq mat
	   (mxm
	     (mapcar (function (lambda (v) (trans v 0 norm T)))
		     '((1.0 0.0 0.0) (0.0 1.0 0.0) (0.0 0.0 1.0))
	     )
	     (list (list (cos ang) (- (sin ang)) 0.0)
		   (list (sin ang) (cos ang) 0.0)
		   '(0.0 0.0 1.0)
	     )
	   )
    )
    (trans (cdr (assoc 10 elst)) norm 0)
  )
)

;;;-----------------------------------------------------------;;
;;; Append displacement vector to a matrix 	-Highflybird- ;;
;;; 把位移矢量添加到矩阵中                                    ;;
;;; 输入：mat -- 矩阵(3x3)，disp -- 位移矢量                  ;;
;;; 输出：一个4X4的变换CAD的标准变换矩阵                      ;;
;;;-----------------------------------------------------------;;
(defun Mat:DispToMatrix	(mat disp)
  (append
    (mapcar 'append mat (mapcar 'list disp))
    '((0. 0. 0. 1.))
  )
)

;;;-----------------------------------------------------------;;
;;; 从一个坐标系统到另一个坐标系统的变换矩阵                  ;;
;;; 输入：from - 源坐标系；to - 目的坐标系                    ;;
;;; 输出：一个4X4的变换CAD的标准变换矩阵                      ;;
;;;-----------------------------------------------------------;;
(defun MAT:Trans (from to)
  (Mat:DispToMatrix
    (mapcar
      (function (lambda (v) (trans v from to t)))
      '((1. 0. 0.) (0. 1. 0.) (0. 0. 1.))
    )
    (trans '(0 0 0) to from)
  )
)

;;;-----------------------------------------------------------;;
;;; wcs到ucs矩阵，也可称UCS的变换矩阵 			      ;;
;;;-----------------------------------------------------------;;
(defun MAT:w2u () (MAT:Trans 0 1))

;;;-----------------------------------------------------------;;
;;; ucs到wcs矩阵，也可称UCS的逆变换矩阵                       ;;
;;;-----------------------------------------------------------;;
(defun MAT:u2w () (MAT:Trans 1 0))

;;;-----------------------------------------------------------;;
;;; 通用变换矩阵 by highflybird				      ;;
;;; 输入：from - 原坐标系，                                   ;;
;;;       to   - 目的坐标系，                                 ;;
;;;       Org  - 目的坐标系的原点相对原坐标系的位置           ;;
;;;       Ang  - 相对于原坐标系的旋转角度                     ;;
;;; 输出：两个矩阵，一个是从原坐标系变换到目的坐标系的变换矩阵;;
;;;       一个是从目的坐标系变换到原坐标系的变换矩阵          ;;
;;;-----------------------------------------------------------;;
(defun MAT:Trans1 (from to Org Ang / Mat Rot Inv Cen)
  (setq	Mat (mapcar (function (lambda (v) (trans v from to T)))
		    '((1. 0. 0.) (0. 1. 0.) (0. 0. 1.))
	    )
  )
  (if (not (equal ang 0 1e-14))
    (setq Rot (list (list (cos ang) (- (sin ang)) 0.)
		    (list (sin ang) (cos ang) 0.)
		    (list 0. 0. 1.)
	      )
	  mat (MAT:mxm mat Rot)
    )
  )
  (setq Cen (trans Org to from))
  (setq Inv (mat:trp mat))
  (list
    (Mat:DispToMatrix Inv (mat:mxv Inv (mapcar '- Cen)))
					;from->to (trans pt from to)
    (Mat:DispToMatrix mat Cen)		;to->from (trans pt to from)
  )
)

;;;-----------------------------------------------------------;;
;;; 通过两个坐标轴和坐标原点定义的变换矩阵  -by highflybird   ;;
;;; 输入：Org  - 坐标系原点，                                 ;;
;;;       Vx   - 坐标系X 方向，                               ;;
;;;       Vy   - 坐标系y 方向                                 ;;
;;; 输出：两个矩阵，一个是该坐标系的变换矩阵，一个是其逆矩阵  ;;
;;;-----------------------------------------------------------;;
(defun MAT:2VMatrix (Org Vx Vy / Vz Rot)
  (if (or (equal Vx '(0 0 0) 1e-14) (equal Vy '(0 0 0) 1e-14))
    '((1. 0. 0. 0.) (0. 1. 0. 0.) (0. 0. 1. 0.) (0. 0. 0. 1.))
    (progn
      (setq Vx (Mat:Unit Vx))		;X Axis
      (setq Vy (Mat:Unit Vy))		;Y Axis
      (setq Vz (Mat:unit (MAT:vxv Vx Vy))) ;Z Axis
      (setq Vy (Mat:unit (MAT:vxv Vz Vx))) ;Y Axis
      (setq Rot (list Vx Vy Vz))	;Rotation matrix
      (list				;Inverse Rotation matrix
	(Mat:DispToMatrix (MAT:trp Rot) Org)
					;The transformation matrix from UCS to WCS
	(Mat:DispToMatrix Rot (MAT:mxv Rot (mapcar '- Org)))
					;The transformation matrix from WCS to UCS
      )
    )
  )
)

;;;-----------------------------------------------------------;;
;;; Mat:3PMatrix  -Highflybird-                               ;;
;;; 通过两个坐标轴和坐标原点定义的变换矩阵  -by highflybird   ;;
;;; 输入：P1 - 坐标系原点，                                   ;;
;;;       P2 - 坐标系的第2点                                  ;;
;;;       P3 - 坐标系的第3点                                  ;;
;;; 输出：两个矩阵，一个是该坐标系的变换矩阵，一个是其逆矩阵  ;;
;;;-----------------------------------------------------------;;
(defun Mat:3PMatrix (p1 p2 p3 / v1 v2 v3)
  (MAT:2VMatrix P1 (mapcar '- p2 p1) (mapcar '- p3 p1))
)

;;;-----------------------------------------------------------;;
;;; 平齐实体的变换矩阵  -by highflybird			      ;;
;;; 输入：Ent - 实体名                                        ;;
;;; 输出：平齐这个实体的变换矩阵和它的逆矩阵                  ;;
;;;-----------------------------------------------------------;;
(defun Mat:EntityMatrix	(Ent / z dxf Cen obj an m1 mat Inv org)
  (setq dxf (entget ent))
  (if (setq Cen (cdr (assoc 10 dxf)))	;Insertpoint,center or startpoint,etc.
    (if	(null (caddr Cen))
      (setq Cen (append Cen '(0.0)))
    )
    (setq Cen '(0 0 0))
  )
  (setq obj (vlax-ename->vla-object Ent))
  (if (and (vlax-property-available-p obj 'elevation)
					;If it has elevation value.
	   (wcmatch (vla-get-objectname obj) "*Polyline")
					;It's a "AcDb2dPolyline" or "AcDbPolyline" object
      )
    (setq z   (vla-get-elevation obj)
	  Cen (list (car Cen) (cadr Cen) (+ (caddr Cen) z))
					;add elevation value
    )
  )
  (if (vlax-property-available-p obj 'rotation)
					;if it has a rotaion angle
    (setq an (vla-get-rotation obj))
    (setq an 0)
  )
  (MAT:Trans1 0 Ent Cen an)		;return two matrices, the first is WCS->OCS,the second is OCS->WCS
)

;;;-----------------------------------------------------------;;
;;;通用的轴测变换矩阵     highflybird  2012.12                ;;
;;;Axonometric projections Rotation matrices                  ;;
;;;Isometric projection: a = (/ pi 4),b = (atan (- (sqrt 2))) ;;
;;;Input: a - Rotation angle about the vertical axis          ;;
;;;       b - Rotation angle about the horizontal axis        ;;
;;;Output: transforamtion matrix of this projection           ;;
;;;-----------------------------------------------------------;;
(defun MAT:ISO (a b / ca sa cb sb)
  (setq ca (cos a))
  (setq sa (sin a))
  (setq cb (cos b))
  (setq sb (sin b))
  (list	(list ca (- sa) 0 0)
	(list (* sa cb) (* ca cb) (- sb) 0)
	(list (* sa sb) (* ca sb) cb 0)
	(list 0 0 0 1)
  )
)

;;;-----------------------------------------------------------;;
;;; 点变换1                                                   ;;
;;; 输入: 要变换的点和原点及变换向量                          ;;
;;; 输出: 点变换后的位置                                      ;;
;;;-----------------------------------------------------------;;
(defun MAT:TransU2W (p p0 v / d x0 y0 x1 y1 dv rt)
  (setq d (distance '(0 0) v))
  (if (equal d 1e-14)
    P0
    (setq x1 (car p)
	  y1 (cadr p)
	  x0 (car v)
	  y0 (cadr v)
	  dv (list (/ (- (* x1 x0) (* y1 y0)) d)
		   (/ (+ (* y1 x0) (* x1 y0)) d)
	     )
	  rt (mapcar '+ P0 dv)
    )
  )
)

;;;-----------------------------------------------------------;;
;;; 点变换2                                                   ;;
;;; 输入: 要变换的点和原点及变换向量                          ;;
;;; 输出: 点变换后的位移向量                                  ;;
;;;-----------------------------------------------------------;;
(defun MAT:TransW2U (p p0 v / d x0 y0 x1 y1 dv)
  (setq d (distance '(0 0) v))
  (if (equal d 1e-14)
    (list 0 0)
    (setq x1 (- (car p) (car p0))
	  y1 (- (cadr p) (cadr p0))
	  x0 (car v)
	  y0 (cadr v)
	  dv (list (/ (+ (* x1 x0) (* y1 y0)) d)
		   (/ (- (* y1 x0) (* x1 y0)) d)
	     )
    )
  )
)
;;;----------------------------------------------------;
;;;功能: 比例缩放点                                    ;
;;;输入: 要缩放的点pt,基点pBase，缩放因子k             ;
;;;输出: 缩放后的点位置                                ;
;;;----------------------------------------------------;
(defun GEO:Scale (Pt pBase k)
  (mapcar (function (lambda (u v) (+ u (* k (- v u)))))
	  pBase
	  Pt
  )
)
;;;----------------------------------------------------;
;;;功能: 比例缩放点2倍                                 ;
;;;输入: 要缩放的点pt,基点pBase                        ;
;;;输出: 缩放后的点位置                                ;
;;;----------------------------------------------------;
(defun GEO:Scale2 (Pt pBase)
  (mapcar (function (lambda (u v) (+ v (- v u)))) pBase Pt)
)
;;;----------------------------------------------------;
;;;功能: 点法线的平面方程                              ;
;;;输入: P0平面上的一点，N平面的法线矢量               ;
;;;输出: 平面方程的系数列表                            ;
;;;----------------------------------------------------;
(defun PLANE:Equation (P0 N)
  (append N (list (- (MAT:Dot P0 N))))
)
;;;----------------------------------------------------;
;;;功能: 三点式平面方程                                ;
;;;输入: 平面上的三点                                  ;
;;;输出: 平面方程的系数列表                            ;
;;;----------------------------------------------------;
(defun PLANE:Equation_3P (P0 P1 P2 / v1 v2 N)
  (setq v1 (mapcar '- p1 p0))
  (setq v2 (mapcar '- P2 p0))
  (setq N (MAT:vxv v1 v2))
  (PLANE:Equation P0 N)
)
;;;----------------------------------------------------;
;;;功能: 点到平面的距离（有向的距离）                  ;
;;;输入: 一点P和平面的方程为Ax+By+Cz+D=0的四个系数     ;
;;;输出: 该点到平面的距离                              ;
;;;----------------------------------------------------;
(defun PLANE:Distance (P A B C D)
  (if (and (zerop A) (zerop B) (zerop C))
    nil
    (/ (+ (* A (car P)) (* B (cadr P)) (* C (caddr P)) D)
       (distance '(0 0 0) (list A B C))
    )
  )
)
;;;----------------------------------------------------;
;;;功能: 点到三点决定的平面的距离（有向的距离）        ;
;;;输入: 一点P和平面的方程为Ax+By+Cz+D=0的四个系数     ;
;;;输出: 该点到平面的距离                              ;
;;;----------------------------------------------------;
(defun PLANE:Distance_1	(P p1 p2 p3 /)
  (Apply 'PLANE:Distance
	 (cons p (PLANE:Equation_3P p1 p2 p3))
  )
)
;;;----------------------------------------------------;
;;;功能: 点到三点决定的平面的距离和该点在平面上的投影点;
;;;输入: 一点P和三点P1,P2,P3决定的平面                 ;
;;;输出: 该点到平面的距离                              ;
;;;----------------------------------------------------;
(defun PLANE:Perpendicular_Foot	(P p1 p2 p3 / F A B C D H N L)
  (setq F (PLANE:Equation_3P p1 p2 p3))
  (setq	A (car f)
	B (cadr f)
	C (caddr f)
	D (last f)
  )
  (setq H (PLANE:Distance p A B C D))
  (setq N (List A B C))
  (setq L (distance '(0 0 0) N))
  (if (not (zerop L))
    (list H (Geo:scale (mapcar '+ p N) P (- (/ H L))))
  )
)
;;;=============================================
;;;      通用函数  检查是否存在图层，如无创建之              
;;;参数：l_l------线型(字符串)              
;;;      l_c------颜色(整型)                
;;;      l_s------图层状态(整型)                      
;;;      l_n------图层名(字符串)
(defun ly_mak (l_l l_c l_s l_n /)
  (if (= (tblobjname "LAYER" l_n) nil)
    (progn
      (entmake (list
		 (cons 0 "LAYER")
		 (cons 100 "AcDbSymbolTableRecord")
		 (cons 100 "AcDbLayerTableRecord")
		 (cons 6 l_l)
		 (cons 62 l_c)
		 (cons 70 l_s)
		 (cons 2 l_n)
	       ) ;_ 结束list
      ) ;_ 结束entmake
    ) ;_ 结束progn
  ) ;_ 结束if
) ;_ 结束defun
;;;中对齐pt1=pt2，左对齐pt2'(0 0 0),中对齐n72 1，左对齐n72 0，左中对齐n73 2
(defun emk_t (layer pt1 pt2 text ang n72 n73 h /)
  (entmakex (list '(0 . "text")
		  '(100 . "AcDbEntity")
		  (cons 8 layer)
		  '(100 . "AcDbText")
		  (cons 10 pt1)
		  (cons 1 text)
		  (cons 40 h)
		  '(41 . 0.75)
		  '(7 . "standard")
		  (cons 72 n72)
		  (cons 11 pt2)
		  (cons 50 ang)
		  (cons 73 n73)
	    ) ;_ 结束list
  ) ;_ 结束entmake
) ;_ 结束defun
(defun x_ssn (ss / n lst)
  (repeat (setq N (sslength ss))
    (setq LST (cons (ssname SS (setq N (1- N))) LST))
  )
)
;;;消重
(defun deldup (ptLst alw / pt1)
  (cond	((<= (length ptLst) 1) ptLst)
	(t
	 (setq pt1 (car ptLst))
	 (cons pt1
	       (vl-remove-if
		 '(lambda (x) (equal pt1 x alw))
		 (deldup (cdr ptLst) alw)
	       )
	 )
	)
  )
)
;;;找重
(defun finddup (l1 / l2)
  (while l1
    (if	(member (car l1) (cdr l1))
      (setq l2 (append
		 l2
		 (list (car l1))
	       )
      )
    )
    (setq l1 (vl-remove (car l1) l1))
  )
  l2
)
;;;两两组表
(defun buildlst	(lst / a lst1)
  (while (> (length lst) 1)
    (setq a (car lst))
    (setq lst (cdr lst))
    (setq lst1 (cons (mapcar '(lambda (x) (list a x)) lst) lst1))
  )
  (apply 'append (reverse lst1))
)
;;;求交
(defun inter (en1 en2)
  (list	(inters	(get_dxf en1 10)
		(get_dxf en1 11)
		(get_dxf en2 10)
		(get_dxf en2 11)
	)
	en1
	en2
  )
)
;;;截取组码
(defun get_dxf (en num /) (cdr (assoc num (entget en))))
;;;赋予组码
(defun put_dxf (en num new / ent)
  (setq	ent (entget en)
	ent (subst (cons num new) (assoc num ent) ent)
  )
  (entmod ent)
)
;;;反余弦
(defun acos (y)
  (atan (sqrt (abs (- 1 (* y y)))) y)
)
;;;反正弦
(defun asin (y)
  (- (/ pi 2) (acos y))
)
;;;表中删除表
(defun del_lst (lstdel lst /)
  (repeat (length lstdel)
    (setq lst	 (vl-remove-if '(lambda (x) (= x (car lstdel))) lst)
	  lstdel (cdr lstdel)
    )
  )
  lst
)
;;;共点则返回en2
(defun andpoint	(en1 en2 /)
  (if (or (equal (get_dxf en1 10) (get_dxf en2 10) 1e-6)
	  (equal (get_dxf en1 10) (get_dxf en2 11) 1e-6)
	  (equal (get_dxf en1 11) (get_dxf en2 10) 1e-6)
	  (equal (get_dxf en1 11) (get_dxf en2 11) 1e-6)
      )
    en2
    nil
  )
)
;;;图元表变为点表
(defun enlst->ptlst (enlst)
  (deldup (append (mapcar '(lambda (x) (get_dxf x 10)) enlst)
		  (mapcar '(lambda (x) (get_dxf x 11)) enlst)
	  )
	  1e-6
  )
)
;;;求两个面的夹角
(defun angle_f&f (ptlst1 ptlst2 / pt1 pt2 pt3 v1 v2 abc def)
  (setq	pt1 (car ptlst1)
	pt2 (cadr ptlst1)
	pt3 (caddr ptlst1)
  )
  (setq	v1 (MAT:v-v pt1 pt2)
	v2 (MAT:v-v pt1 pt3)
  )
  (setq abc (MAT:vxv v1 v2))
  (setq	pt1 (car ptlst2)
	pt2 (cadr ptlst2)
	pt3 (caddr ptlst2)
  )
  (setq	v1 (MAT:v-v pt1 pt2)
	v2 (MAT:v-v pt1 pt3)
  )
  (setq def (MAT:vxv v1 v2))
  (acos	(/ (MAT:Dot abc def)
	   (MAT:norm abc)
	   (MAT:norm def)
	)
  )
)
;;;求线与面的夹角
(defun angle_l&f (pta ptb ptlst / pt1 pt2 pt3 v1 v2 abc v)
  (setq	pt1 (car ptlst)
	pt2 (cadr ptlst)
	pt3 (caddr ptlst)
  )
  (setq	v1 (MAT:v-v pt1 pt2)
	v2 (MAT:v-v pt1 pt3)
  )
  (setq abc (MAT:vxv v1 v2))
  (setq v (MAT:v-v pta ptb))
  (asin	(/ (abs (MAT:Dot abc v))
	   (MAT:norm abc)
	   (MAT:norm v)
	)
  )
)
(vl-load-com)
(defun zh1 (ss	   /	  enlst	 lst	facelst	      intlst en1
	    en2	   en3	  face1	 face2	ang    pt     v	     objlst
	    oldvar ucspt  facept d1	d2     d3
	   )
  (setq oldvar (getvar "osmode"))
  (setvar "osmode" 0)
;;;(setq enlst(x_ssn ss))
;;;拷贝一个表
  (setq	objlst (mapcar 'vla-copy
		       (mapcar 'vlax-ename->vla-object (x_ssn ss))
	       )
  )
  (setq enlst (mapcar 'vlax-vla-object->ename objlst))
;;;将原始坐标赋予图元
  (foreach n enlst
    (vlax-ldata-put
      n
      "coordinate"
      (list (get_dxf n 10) (get_dxf n 11))
    )
  )
  (setq lst enlst)
;;;取得第一图元
  (setq en1 (car enlst))
  (setq facelst nil)
;;;以下循环开始
  (while (> (length enlst) 2)
;;;从表中删除第一个图元
    (setq enlst (del_lst (list en1) enlst))
    (if	(> (length enlst) 2)
      (progn
;;;找出与第一个图元共点的图元
	(setq
	  intlst
	   (vl-remove-if-not '(lambda (x) (andpoint en1 x)) enlst)
	)
;;;两两组表
	(setq intlst (mapcar '(lambda (x) (eval (cons 'inter x)))
			     (buildlst intlst)
		     )
	)
;;;找到不相交的图元
	(setq a (vl-remove-if '(lambda (x) (car x)) intlst))
;;;找到相交且交点不在第一图元端点的图元
	(setq b	(vl-remove-if
		  '(lambda (x)
		     (or (equal (car x) (get_dxf en1 10) 1e-6)
			 (equal (car x) (get_dxf en1 11) 1e-6)
		     )
		   )
		  (del_lst a intlst)
		)
	)
;;;取得第一面第二图元
	(setq en2 (finddup (append (cdar a) (cdar b))))
;;;取得第二面第一图元亦即第一面第三图元
	(setq en3 (del_lst en2 (cdar b)))
	(setq facelst (cons (list en1 (car en2) (car en3)) facelst))
	(setq enlst (del_lst en2 enlst))
	(setq en1 (car en3))
      )
      (setq facelst (cons (cons en1 enlst) facelst))
    )
  )
  (setq facelst (reverse facelst))
  (setq ucspt (enlst->ptlst (car facelst)))
;;;循环开始
  (while (> (length facelst) 1)
;;;求第二面与第一面夹角
    (setq face1	(car facelst)
	  face2	(cadr facelst)
    )
    (setq ang (angle_f&f (enlst->ptlst face2) (enlst->ptlst face1))
	  pt  (get_dxf (car face2) 10)
	  v   (MAT:v-v (get_dxf (car face2) 11) pt)
    )
    (if	(> ang (/ pi 2))
      (setq ang (- pi ang))
    )
    (if	(null (or (equal ang 0. 1e-6) (equal ang pi 1e-6)))
      (mapcar '(lambda (x)
		 (vla-transformby
		   x
		   (vlax-tmatrix
		     (MAT:Rotation3D
		       pt
		       v
		       ang
		     )
		   )
		 )
	       )
	      (mapcar 'vlax-ename->vla-object (del_lst face1 lst))
      )
    )
    (setq facept (enlst->ptlst face2))
    (setq d1 (car (PLANE:Perpendicular_Foot
		    (car facept)
		    (car ucspt)
		    (cadr ucspt)
		    (caddr ucspt)
		  )
	     )
    )
    (setq d2 (car (PLANE:Perpendicular_Foot
		    (cadr facept)
		    (car ucspt)
		    (cadr ucspt)
		    (caddr ucspt)
		  )
	     )
    )
    (setq d3 (car (PLANE:Perpendicular_Foot
		    (caddr facept)
		    (car ucspt)
		    (cadr ucspt)
		    (caddr ucspt)
		  )
	     )
    )
    (if	(null (and (equal d1 0. 1e-6)
		   (equal d2 0. 1e-6)
		   (equal d3 0. 1e-6)
	      )
	)
      (mapcar '(lambda (x)
		 (vla-transformby
		   x
		   (vlax-tmatrix
		     (MAT:Rotation3D
		       pt
		       v
		       (* -2 ang)
		     )
		   )
		 )
	       )
	      (mapcar 'vlax-ename->vla-object (del_lst face1 lst))
      )
    )
    (setq facelst (cdr facelst)
	  lst	  (del_lst (list (car face1) (cadr face1)) lst)
    )
  )
  (command "ucs" "3" (car ucspt) (cadr ucspt) (caddr ucspt))
  (foreach n (mapcar 'vlax-vla-object->ename objlst)
    (put_dxf n 10 (trans (get_dxf n 10) 0 1))
    (put_dxf n 11 (trans (get_dxf n 11) 0 1))
  )
  (command "ucs" "w")
  (setvar "osmode" oldvar)
)
(defun c:zh nil (zh1 (ssget)))
;;;(vlax-ldata-get (car(entsel))"coordinate")
(defun bzb1 (ss / lst sca pt pty ptx ptz pt10 pt11 tx ty tz ptlst)
  (setq	lst (x_ssn ss)
	sca (* (getvar "userr1")
	       (/ (getvar "userr2") (getvar "userr1"))
	    )
  )
  (ly_mak "CONTINUOUS" 2 0 "坐标")
  (foreach n lst
    (setq pt10 (car (vlax-ldata-get n "coordinate")))
    (setq pt11 (cadr (vlax-ldata-get n "coordinate")))
    (if	(null
	  (vl-remove-if-not '(lambda (x) (equal pt10 x 1e-6)) ptlst)
	)
      (progn
	(setq pt (get_dxf n 10))
	(setq pty (polar pt 0 (* sca 2.00)))
	(setq ptx (polar pty (/ pi 2) (* sca 3.00)))
	(setq ptz (polar pty (/ pi -2) (* sca 3.00)))
	(setq tx (strcat "X=" (rtos (car pt10) 2 0)))
	(setq ty (strcat "Y=" (rtos (cadr pt10) 2 0)))
	(setq tz (strcat "Z=" (rtos (caddr pt10) 2 0)))
	(emk_t "坐标" ptx ptx tx 0 0 2 (* sca 2.50))
	(emk_t "坐标" pty pty ty 0 0 2 (* sca 2.50))
	(emk_t "坐标" ptz ptz tz 0 0 2 (* sca 2.50))
	(setq ptlst (cons pt10 ptlst))
      )
    )
    (if	(null
	  (vl-remove-if-not '(lambda (x) (equal pt11 x 1e-6)) ptlst)
	)
      (progn
	(setq pt (get_dxf n 11))
	(setq pty (polar pt 0 (* sca 2.00)))
	(setq ptx (polar pty (/ pi 2) (* sca 3.00)))
	(setq ptz (polar pty (/ pi -2) (* sca 3.00)))
	(setq tx (strcat "X=" (rtos (car pt11) 2 0)))
	(setq ty (strcat "Y=" (rtos (cadr pt11) 2 0)))
	(setq tz (strcat "Z=" (rtos (caddr pt11) 2 0)))
	(emk_t "坐标" ptx ptx tx 0 0 2 (* sca 2.50))
	(emk_t "坐标" pty pty ty 0 0 2 (* sca 2.50))
	(emk_t "坐标" ptz ptz tz 0 0 2 (* sca 2.50))
	(setq ptlst (cons pt11 ptlst))
      )
    )
    (vlax-ldata-delete n "coordinate")
  )
)
(defun c:bzb nil (bzb1 (ssget)))
;;;去除Z轴
(defun del_z (pt /)
  (setq pt (reverse (cdr (reverse pt))))
) ;_ 结束defun
;;;
(defun bxc1 (ss / lst n i en pt1 pt2 ptm tl len ang sca)
	(setq	sca (* (getvar "userr1")
	       (/ (getvar "userr2") (getvar "userr1"))
	    )
	)
	(setq lst nil)
	(setq n (sslength ss))
	(setq i 0)
	(ly_mak "CONTINUOUS" 6 0 "杆件长")
	(while (< i n)
		(setq en (entget (ssname ss i)))
		(setq pt1 (cdr (assoc 10 en)))
		(if	(= (member pt1 lst) nil)
			(setq lst (cons pt1 lst))
		) ;_ 结束if
		(setq pt2 (cdr (assoc 11 en)))
		(if	(= (member pt2 lst) nil)
			(setq lst (cons pt2 lst))
		) ;_ 结束if
		(setq len (distance pt1 pt2))
		(setq tl (rtos len 2 0))
		(if
			(and
				(or
					(< (car pt1) (car pt2))
					(equal (car pt1) (car pt2) 0.000001)
				) ;_ 结束or
				(or
					(< (cadr pt1) (cadr pt2))
					(equal (cadr pt1) (cadr pt2) 0.000001)
				) ;_ 结束or
			) ;_ 结束and
			(progn (setq ang (angle pt1 pt2))
				(setq PM
					(polar
						(POLAR	(del_z pt1)
							ang
							(	/ (DISTANCE (del_z pt1) (del_z pt2)) 2)
						) ;_ 结束POLAR
						(+ ang (/ pi 2))
						(* sca 1.)
					) ;_ 结束polar
				) ;_ 结束setq
			)					;第一象限progn
		(if (and (or (> (car pt1) (car pt2))
		   (equal (car pt1) (car pt2) 0.000001)
	       ) ;_ 结束or
	       (or (< (cadr pt1) (cadr pt2))
		   (equal (cadr pt1) (cadr pt2) 0.000001)
	       ) ;_ 结束or
		) ;_ 结束and
		(progn
		(setq ang (angle pt2 pt1))
		(setq
	    PM (polar (POLAR (del_z pt2)
			     ang
			     (/ (DISTANCE (del_z pt2) (del_z pt1)) 2)
		      ) ;_ 结束POLAR
		      (+ ang (/ pi 2))
		      (* sca 1.)
	       ) ;_ 结束polar
		) ;_ 结束setq
		)				;第二象限progn
		(if (and (or (> (car pt1) (car pt2))
		     (equal (car pt1) (car pt2) 0.000001)
		 ) ;_ 结束or
		 (or (> (cadr pt1) (cadr pt2))
		     (equal (cadr pt1) (cadr pt2) 0.000001)
		 ) ;_ 结束or
	    ) ;_ 结束and
		(progn (setq ang (angle pt2 pt1))
		 (setq PM
			(polar (POLAR (del_z pt2)
				      ang
				      (/ (DISTANCE (del_z pt2) (del_z pt1)) 2)
			       ) ;_ 结束POLAR
			       (+ ang (/ pi 2))
			       (* sca 1.)
			) ;_ 结束polar
		 ) ;_ 结束setq
		)				;第三象限progn
			(progn (setq ang (angle pt1 pt2))
		 (setq PM
			(polar (POLAR (del_z pt1)
				      ang
				      (/ (DISTANCE (del_z pt1) (del_z pt2)) 2)
			       ) ;_ 结束POLAR
			       (+ ang (/ pi 2))
			       (* sca 1.)
			) ;_ 结束polar
			) ;_ 结束setq
			)				;第四象限progn
			)				;第三象限if
			)					;第二象限if
		)					;第一象限if
		(emk_t "杆件长" pm pm tl ang 1 0 (* sca 2.5))
		(setq i (1+ i))
	) ;_ 结束while
	(PRINC)
) ;_ 结束defun
(defun c:bxc nil (bxc1 (ssget)))
(defun bjm1 (ss / lst n i en pt1 pt2 tl len ang sca col)
  (setq	sca (* (getvar "userr1")
	       (/ (getvar "userr2") (getvar "userr1"))
	    )
  )
  (setq lst nil)
  (setq n (sslength ss))
  (setq i 0)
  (ly_mak "CONTINUOUS" 20 0 "截面")
  (while (< i n)
    (setq en (entget (ssname ss i)))
    (setq pt1 (cdr (assoc 10 en)))
    (setq col (cdr (assoc 8 en)))
    (if	(= (member pt1 lst) nil)
      (setq lst (cons pt1 lst))
    ) ;_ 结束if
    (setq pt2 (cdr (assoc 11 en)))
    (if	(= (member pt2 lst) nil)
      (setq lst (cons pt2 lst))
    ) ;_ 结束if
    (setq len (distance pt1 pt2))
    (setq tl (rtos len))
    (if	(and (or (< (car pt1) (car pt2))
		 (equal (car pt1) (car pt2) 0.000001)
	     ) ;_ 结束or
	     (or (< (cadr pt1) (cadr pt2))
		 (equal (cadr pt1) (cadr pt2) 0.000001)
	     ) ;_ 结束or
	) ;_ 结束and
      (progn (setq ang (angle pt1 pt2))
	     (setq
	       PM (polar (POLAR	(del_z pt1)
				ang
				(/ (DISTANCE (del_z pt1) (del_z pt2)) 2)
			 ) ;_ 结束POLAR
			 (+ ang (/ pi 2))
			 (* sca 1.)
		  ) ;_ 结束polar
	     ) ;_ 结束setq
      )					;第一象限progn
      (if (and (or (> (car pt1) (car pt2))
		   (equal (car pt1) (car pt2) 0.000001)
	       ) ;_ 结束or
	       (or (< (cadr pt1) (cadr pt2))
		   (equal (cadr pt1) (cadr pt2) 0.000001)
	       ) ;_ 结束or
	  ) ;_ 结束and
	(progn
	  (setq ang (angle pt2 pt1))
	  (setq
	    PM (polar (POLAR (del_z pt2)
			     ang
			     (/ (DISTANCE (del_z pt2) (del_z pt1)) 2)
		      ) ;_ 结束POLAR
		      (+ ang (/ pi 2))
		      (* sca 1.)
	       ) ;_ 结束polar
	  ) ;_ 结束setq
	)				;第二象限progn
	(if (and (or (> (car pt1) (car pt2))
		     (equal (car pt1) (car pt2) 0.000001)
		 ) ;_ 结束or
		 (or (> (cadr pt1) (cadr pt2))
		     (equal (cadr pt1) (cadr pt2) 0.000001)
		 ) ;_ 结束or
	    ) ;_ 结束and
	  (progn (setq ang (angle pt2 pt1))
		 (setq PM
			(polar (POLAR (del_z pt2)
				      ang
				      (/ (DISTANCE (del_z pt2) (del_z pt1)) 2)
			       ) ;_ 结束POLAR
			       (+ ang (/ pi 2))
			       (* sca 1.)
			) ;_ 结束polar
		 ) ;_ 结束setq
	  )				;第三象限progn
	  (progn (setq ang (angle pt1 pt2))
		 (setq PM
			(polar (POLAR (del_z pt1)
				      ang
				      (/ (DISTANCE (del_z pt1) (del_z pt2)) 2)
			       ) ;_ 结束POLAR
			       (+ ang (/ pi 2))
			       (* sca 1.)
			) ;_ 结束polar
		 ) ;_ 结束setq
	  )				;第四象限progn
	)				;第三象限if
      )					;第二象限if
    )					;第一象限if
    (emk_t "截面"
	   pm
	   pm
	   (strcat "%%130" col)
	   ang
	   1
	   0
	   (* sca 2.5)
    )
    (setq i (1+ i))
  ) ;_ 结束while
  (PRINC)
) ;_ 结束defun
(defun c:bjm nil (bjm1 (ssget)))
(defun c:del0 (/ ss)
  (setq ss (ssget '((0 . "line"))))
  (foreach n (x_ssn ss)
    (if	(equal (get_dxf n 10) (get_dxf n 11) 1e-6)
      (entdel n)
    )
  )
)
(defun c:zbb (/ ss)
  (setq enlst (x_ssn (ssget)))
;;;将原始坐标赋予图元
  (foreach n enlst
    (vlax-ldata-put
      n
      "coordinate"
      (list (get_dxf n 10) (get_dxf n 11))
    )
  )
)
;;;局部图元显示隐藏
;;;反向隐藏
(defun c:fxyc (/ ss i sn ent lx a)
  (setvar "cmdecho" 0)
  (setq ss (ssget))
  (command "SELECT" "ALL" "R" ss "")
  (setq ss (ssget "P"))
  (setq i 0)
  (repeat (sslength ss)
    (setq sn (ssname ss i))
    (setq ent (entget sn))
    (setq lx (cdr (assoc 60 ent)))
    (if	(= lx nil)
      (progn
	(setq a (list (cons 60 1)))
	(setq ent (append ent a))
	(entmod ent)
      )
    )
    (if	(/= lx nil)
      (progn
	(setq ent (subst (cons 60 1) (assoc 60 ent) ent))
	(entmod ent)
      )
    )
    (setq i (1+ i))
  )
  (princ)
)
;;;隐藏
(defun c:yc (/ ss i ent lx a)
	(setvar "cmdecho" 0)
	(setq ss (ssget))
	(setq i 0)
	(repeat (sslength ss)
		(setq sn (ssname ss i))
		(setq ent (entget sn))
		(setq lx (cdr (assoc 60 ent)))
		(if	(= lx nil)
		  (progn
			(setq a (list (cons 60 1)))
			(setq ent (append ent a))
			(entmod ent)
		  )
		)
		(if	(/= lx nil)
		  (progn
			(setq ent (subst (cons 60 1) (assoc 60 ent) ent))
			(entmod ent)
		  )
		)
		(setq i (1+ i))
	)
  (princ)
)
;;;全部显示
(defun c:xs (/ ss i sn ent)
  (setvar "cmdecho" 0)
  (setq ss (ssget "x" '((60 . 1))))
  (setq i 0)
  (repeat (sslength ss)
    (setq sn (ssname ss i))
    (setq ent (entget sn))
    (setq ent (subst (cons 60 0) (assoc 60 ent) ent))
    (entmod ent)
    (setq i (1+ i))
  )
  (princ)
)

;;;双向偏移
(defun c:oo (/ ss r)
  (setq ss (ssget))
  (setq r (getreal "\n偏移距离:"))
  (foreach n (x_ssn ss)
    (vla-offset (vlax-ename->vla-object n) r)
    (vla-offset (vlax-ename->vla-object n) (- r))
  )
)