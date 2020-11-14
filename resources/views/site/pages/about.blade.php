@extends('layouts.frontend.index')
@section('content')
<!-- content start -->
    <div class="container-fluid p-0 home-content">
        <!-- banner start -->
        <div class="subpage-slide-blue">
            <div class="container">
                <h1>About</h1>
            </div>
        </div>
        <!-- banner end -->

        <!-- breadcrumb start -->
            <div class="breadcrumb-container">
                <div class="container">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">About</li>
                  </ol>
                </div>
            </div>

        <!-- breadcrumb end -->

        <article class="container">
                    <div class="row">
                        <div class="col-12">
                           <h5 class="mt-3 underline-heading">OUR MISSION IS SIMPLE</h5>
                           <p> To be able to give a local community a good elearning system. </p>
                           <p> This is a new path we have taken and we hope to see this effort of us grow with all of the community seeking help, especially in this pandemic.</p>

                           <!-- <ul class="ul-no-padding about-ul">
                                <li>Commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Commodo ligula eget dolor. Aenean massa. Port sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>
                                <li>Dum sociis natoque penatibus et magnis dis parturient montes</li>
                                <li>Nascetur ridiculus mus, Nulla consequat massa quis enim, Cum sociis natoque penatibus et magnis dis parturient montes</li>
                                <li>Commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>
                                <li>Nascetur ridiculus mus, Nulla consequat massa quis enim  </li>
                                <li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus, Nulla consequat massa quis enim </li>
                                <li>Consectetuer adipiscing elit. Aenean commodo ligula eget dolor</li>

                            </ul> -->
                        </div>
                    </div>
                </article>
                <!-- <article class="count-block jumbotron">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                            <h3 class="underline-heading">150</h3>
                            <h6>COUNTRIES REACHED</h6>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                            <h3 class="underline-heading">850</h3>
                            <h6>COUNTRIES REACHED</h6>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                            <h3 class="underline-heading">38300</h3>
                            <h6>PASSED GRADUATES</h6>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                            <h3 class="underline-heading">3400</h3>
                            <h6>COURSES PUBLISHED</h6>
                        </div>
                    </div>
                </div>
            </article> -->
            <article class="about-features-block">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center seperator-head mt-3">
                        <h3>Why choose Us?</h3>
                        <p class="mt-3">We offer subjects and reviewers that are based in our own curriculum here in the Philippines. </p>
                    </div>
                </div>
                                <div class="row mt-4 mb-5">
                                        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-file-signature"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Online Learning</h6>
                                    <p>Online. No need for physical contact and being expose outside.</p>
                                </div>
                            </main>
                        </div>
                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-users-cog"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Course Discussion </h6>
                                    <p>Build communities with your own subjects and connect people who wants to learn.</p>
                                </div>
                            </main>
                        </div>
                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-shield-alt"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Website Security </h6>
                                    <p>You can rest assured that your information will never get out from the site.</p>
                                </div>
                            </main>
                        </div>
                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-chalkboard-teacher"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Qualified teachers </h6>
                                    <p>As instructor, you can register and sell your courses or quizzes here.</p>
                                </div>
                            </main>
                        </div>
                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-building"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Virtual Classrooms </h6>
                                    <p>A capable but small virtual classroom to learn your necessary subjects.</p>
                                </div>
                            </main>
                        </div>
                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <!-- <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-digital-tachograph"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Advanced teaching </h6>
                                    <p>Aenean massa. Sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. </p>
                                </div>
                            </main>
                        </div>
                    </div> -->
                                    <!-- <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-puzzle-piece"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Adavanced study plans </h6>
                                    <p>Aenean massa. Sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. </p>
                                </div>
                            </main>
                        </div>
                    </div> -->
                                    <!-- <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-bullseye"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Focus on target </h6>
                                    <p>Aenean massa. Sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. </p>
                                </div>
                            </main>
                        </div>
                    </div> -->
                                    <!-- <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-thumbs-up"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Focus on success </h6>
                                    <p>Aenean massa. Sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. </p>
                                </div>
                            </main>
                        </div>
                    </div> -->
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-tablet-alt"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Responsive Design </h6>
                                    <p>You can take your quizzes and courses away from your desktop computer with the site's responsive UI design.</p>
                                </div>
                            </main>
                        </div>
                    </div>
                                    <!-- <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-credit-card"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">Payment Gateways </h6>
                                    <p>Aenean massa. Sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. </p>
                                </div>
                            </main>
                        </div>
                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                        <div class="feature-box mx-auto text-center">
                            <main>
                                <i class="fas fa-search-plus"></i>
                                <div class="col-md-12">
                                    <h6 class="instructor-title">SEO Friendly </h6>
                                    <p>Aenean massa. Sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. </p>
                                </div>
                            </main>
                        </div>
                    </div> -->
                                </div>
            </div>
        </article>
@endsection

@section('javascript')
<script type="text/javascript">

</script>
@endsection
