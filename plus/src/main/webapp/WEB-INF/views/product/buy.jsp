<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
html {
  height: 100%;
  scroll-padding-top: calc(4.5rem - 1px);
}

body {
  width: 100%;
  height: 100%;
}

.page-section {
  padding: 8rem 0;
}

.text-white-75 {
  color: rgba(255, 255, 255, 0.75) !important;
}

.btn-xl {
  padding: 1.25rem 2.25rem;
  font-size: 0.85rem;
  font-weight: 700;
  text-transform: uppercase;
  border: none;
  border-radius: 10rem;
}

hr.divider {
  height: 0.2rem;
  max-width: 3.25rem;
  margin: 1.5rem auto;
  background-color: #f4623a;
  opacity: 1;
}

hr.divider-light {
  background-color: #fff;
}

#mainNav {
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
  background-color: #fff;
  transition: background-color 0.2s ease;
}
#mainNav .navbar-brand {
  font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-weight: 700;
  color: #212529;
}
#mainNav .navbar-nav .nav-item .nav-link {
  color: #6c757d;
  font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-weight: 700;
  font-size: 0.9rem;
  padding: 0.75rem 0;
}
#mainNav .navbar-nav .nav-item .nav-link:hover, #mainNav .navbar-nav .nav-item .nav-link:active {
  color: #f4623a;
}
#mainNav .navbar-nav .nav-item .nav-link.active {
  color: #f4623a !important;
}
@media (min-width: 992px) {
  #mainNav {
    box-shadow: none;
    background-color: transparent;
  }
  #mainNav .navbar-brand {
    color: black;
  }
  #mainNav .navbar-brand:hover {
    color: #f4623a;
  }
  #mainNav .navbar-nav .nav-item .nav-link {
    color: black;
    padding: 0 1rem;
  }
  #mainNav .navbar-nav .nav-item .nav-link:hover {
    color: #f4623a;
  }
  #mainNav .navbar-nav .nav-item:last-child .nav-link {
    padding-right: 0;
  }
  #mainNav.navbar-shrink {
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
    background-color: #fff;
  }
  #mainNav.navbar-shrink .navbar-brand {
    color: #212529;
  }
  #mainNav.navbar-shrink .navbar-brand:hover {
    color: #f4623a;
  }
  #mainNav.navbar-shrink .navbar-nav .nav-item .nav-link {
    color: #212529;
  }
  #mainNav.navbar-shrink .navbar-nav .nav-item .nav-link:hover {
    color: #f4623a;
  }
}

header.masthead {
  padding-top: 10rem;
  padding-bottom: calc(10rem - 4.5rem);
  background: white;
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: scroll;
  background-size: cover;
}
header.masthead h1, header.masthead .h1 {
  font-size: 2.25rem;
}
@media (min-width: 992px) {
  header.masthead {
    height: 100vh;
    min-height: 40rem;
    padding-top: 4.5rem;
    padding-bottom: 0;
  }
  header.masthead p {
    font-size: 1.15rem;
  }
  header.masthead h1, header.masthead .h1 {
    font-size: 3rem;
  }
}

@media (min-width: 1200px) {
  header.masthead h1, header.masthead .h1 {
    font-size: 3.5rem;
  }
}
header.masthead {
  padding-top: 10rem;
  padding-bottom: calc(10rem - 4.5rem);
  background: white;
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: scroll;
  background-size: cover;
}
header.masthead h1, header.masthead .h1 {
  font-size: 2.25rem;
}
@media (min-width: 992px) {
  header.masthead {
    height: 100vh;
    min-height: 40rem;
    padding-top: 4.5rem;
    padding-bottom: 0;
  }
  header.masthead p {
    font-size: 1.15rem;
  }
  header.masthead h1, header.masthead .h1 {
    font-size: 3rem;
  }
}

@media (min-width: 1200px) {
  header.masthead h1, header.masthead .h1 {
    font-size: 3.5rem;
  }
}
#portfolio .container-fluid, #portfolio .container-sm, #portfolio .container-md, #portfolio .container-lg, #portfolio .container-xl, #portfolio .container-xxl {
  max-width: 1920px;
}
#portfolio .container-fluid .portfolio-box, #portfolio .container-sm .portfolio-box, #portfolio .container-md .portfolio-box, #portfolio .container-lg .portfolio-box, #portfolio .container-xl .portfolio-box, #portfolio .container-xxl .portfolio-box {
  position: relative;
  display: block;
}
#portfolio .container-fluid .portfolio-box .portfolio-box-caption, #portfolio .container-sm .portfolio-box .portfolio-box-caption, #portfolio .container-md .portfolio-box .portfolio-box-caption, #portfolio .container-lg .portfolio-box .portfolio-box-caption, #portfolio .container-xl .portfolio-box .portfolio-box-caption, #portfolio .container-xxl .portfolio-box .portfolio-box-caption {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  width: 100%;
  height: 100%;
  position: absolute;
  bottom: 0;
  text-align: center;
  opacity: 0;
  color: #fff;
  background: rgba(244, 98, 58, 0.9);
  transition: opacity 0.25s ease;
  text-align: center;
}
#portfolio .container-fluid .portfolio-box .portfolio-box-caption .project-category, #portfolio .container-sm .portfolio-box .portfolio-box-caption .project-category, #portfolio .container-md .portfolio-box .portfolio-box-caption .project-category, #portfolio .container-lg .portfolio-box .portfolio-box-caption .project-category, #portfolio .container-xl .portfolio-box .portfolio-box-caption .project-category, #portfolio .container-xxl .portfolio-box .portfolio-box-caption .project-category {
  font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-size: 0.85rem;
  font-weight: 600;
  text-transform: uppercase;
}
#portfolio .container-fluid .portfolio-box .portfolio-box-caption .project-name, #portfolio .container-sm .portfolio-box .portfolio-box-caption .project-name, #portfolio .container-md .portfolio-box .portfolio-box-caption .project-name, #portfolio .container-lg .portfolio-box .portfolio-box-caption .project-name, #portfolio .container-xl .portfolio-box .portfolio-box-caption .project-name, #portfolio .container-xxl .portfolio-box .portfolio-box-caption .project-name {
  font-size: 1.2rem;
}
#portfolio .container-fluid .portfolio-box:hover .portfolio-box-caption, #portfolio .container-sm .portfolio-box:hover .portfolio-box-caption, #portfolio .container-md .portfolio-box:hover .portfolio-box-caption, #portfolio .container-lg .portfolio-box:hover .portfolio-box-caption, #portfolio .container-xl .portfolio-box:hover .portfolio-box-caption, #portfolio .container-xxl .portfolio-box:hover .portfolio-box-caption {
  opacity: 1;
}
</style>

 <header class="masthead p-3">
            <div class="container px-4 px-lg-5 h-100">
                <section class="py-5">
                    <div class="container px-4 px-lg-5 my-3">
                        <div class="row gx-4 gx-lg-5 align-items-center">
                            <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg"/></div>
                            <div class="col-md-6">
                                <div class="small mb-1">쿠킹</div>
                                <h1 class="display-5 fw-bolder">도원 차돌짬뽕</h1>
                                <div class="fs-5 mb-5">
                                    <span class="text-decoration-line-through">15,000원</span>
                                    <span>10,000원</span>
                                </div>
                                <p class="lead">
                                    원데이 클래스 설명들 넣어주세요. <br>
                                    1. 강사 : 태희형 <br>
                                    2. ...
                                </p>
                                <div class="d-flex">
                                    <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                                    <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                        <i class="bi-cart-fill me-1"></i>
                                        예약하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
                <section class="py-3 mb-5">
                    <div class="container px-4 px-lg-5 mt-5">
                        <h2 class="fw-bolder mb-4">추천 클래스</h2>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">클래스 - 1</h5>
                                            <!-- Product price-->
                                            10,000원 - 20,000원
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">보러 가기</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Sale badge-->
                                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                    <!-- Product image-->
                                    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">특가 클래스</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            <span class="text-muted text-decoration-line-through">50,000원</span>
                                            30,000원
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">보러 가기</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Sale badge-->
                                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Event</div>
                                    <!-- Product image-->
                                    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">이벤트 클래스</h5>
                                            <!-- Product price-->
                                            <span class="text-muted text-decoration-line-through">40,000원</span>
                                            25,000원
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">보러 가기</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">인기상품</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            60,000원
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">보러 가기</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </header>
        
        
        <!-- Services-->
        <section class="page-section mt-5" id="services">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">술과 안주 추천</h2>
                <hr class="divider" />
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">라멘</h3>
                            <p class="text-muted mb-0">맥주</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">짬뽕 + 탕수육</h3>
                            <p class="text-muted mb-0">이과두주, 고량주</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-globe fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">삼겹살</h3>
                            <p class="text-muted mb-0">소주</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-heart fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">하몽과 화채</h3>
                            <p class="text-muted mb-0">양주, 와인</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio-->
        
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="#" title="Project Name">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg"/>
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">사진</div>
                                <div class="project-name">사진바꿔야합니다.</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="#" title="Project Name">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">사진</div>
                                <div class="project-name">사진바꿔야합니다.</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="#" title="Project Name">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">사진</div>
                                <div class="project-name">사진바꿔야합니다.</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="#" title="Project Name">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg"/>
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">사진</div>
                                <div class="project-name">사진바꿔야합니다.</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="#" title="Project Name">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">사진</div>
                                <div class="project-name">사진바꿔야합니다.</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="#" title="Project Name">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" />
                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50">사진</div>
                                <div class="project-name">사진바꿔야합니다.</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Call to action-->
        <section class="page-section bg-dark text-white">
            <div class="container px-4 px-lg-5 text-center">
                <h2 class="mb-4">사진 넘어가는거랑 나가는 버튼 만들어야함</h2>
                <a href="#" class="btn btn-light btn-xl">수정사항입니다</a>
            </div>
        </section>
        
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <h2 class="mt-0">이메일로 전송하기</h2>
                        <hr class="divider" />
                        <p class="text-muted mb-5">이메일로 전송되게끔 만들거임</p>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
                        
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">이름</label>
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                <label for="email">이메일</label>
                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                <label for="phone">핸드폰 번호</label>
                            </div>
                            <!-- Message input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                <label for="message">메세지</label>
                            </div>
                            
                            <!-- Submit Button-->
                            <div class="d-grid">
								<button type="button" class="btn btn-primary btn-xl" id="submitButton" >
									보내기
								</button>
							</div>
                        </form>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-4 text-center mb-5 mb-lg-0">
                        <i class="bi-phone fs-2 mb-3 text-muted"></i>
                        <P>고객센터 번호</P>
                        <div>010-1111-1111</div>
                    </div>
                </div>
            </div>
        </section>