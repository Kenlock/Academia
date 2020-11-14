<div class="site-menubar-body">
  <div>
    <div>
      <ul class="site-menu" data-plugin="menu">
        <li class="site-menu-item {{ request()->is('instructor-dashboard') ? 'active' : '' }}">
            <a href="{{ route('instructor.dashboard') }}">
                <i class="site-menu-icon wb-dashboard" aria-hidden="true"></i>
                <span class="site-menu-title">Dashboard</span>
            </a>
        </li>
        <li class="site-menu-item {{ request()->is('instructor-profile') ? 'active' : '' }}">
            <a href="{{ route('instructor.profile.get') }}">
                <i class="site-menu-icon fas fa-user" aria-hidden="true"></i>
                <span class="site-menu-title">Profile</span>
            </a>
        </li>
        <li class="site-menu-item {{ request()->is('instructor-course-*') ? 'active' : '' }}">
            <a href="{{ route('instructor.course.list') }}">
                <i class="site-menu-icon fas fa-chalkboard" aria-hidden="true"></i>
                <span class="site-menu-title">Courses</span>
            </a>
        </li>
        <li class="site-menu-item {{ request()->is('instructor-quiz-*') ? 'active' : '' }}">
            <a href="{{ route('instructor.quiz.list') }}">
                <i class="site-menu-icon fas fa-pencil-alt" aria-hidden="true"></i>
                <span class="site-menu-title">Quizzes</span>
            </a>
        </li>
        <li class="site-menu-item {{ request()->is('instructor-enrolment') ? 'active' : '' }}">
            <a href="{{ route('instructor.enrolment') }}">
                <i class="site-menu-icon far fa-address-card" aria-hidden="true"></i>
                <span class="site-menu-title">Enrolments</span>
            </a>
        </li>
        <li class="site-menu-item {{ request()->is('instructor->category*') ? 'active' : '' }}">
            <a href="{{ route('instructor.categories') }}">
                <i class="site-menu-icon wb-tag" aria-hidden="true"></i>
                <span class="site-menu-title">Categories</span>
            </a>
        </li>
        <li class="site-menu-item {{ request()->is('instructor->profit*') ? 'active' : '' }}">
            <a href="{{ route('instructor.getProfit') }}">
                <i class="far fa-money-bill-alt" aria-hidden="true"></i>
                <span class="site-menu-title">&nbsp&nbsp Check Profit</span>
            </a>
        </li>
        <!-- <li class="site-menu-item {{ request()->is('instructor-credits') ? 'active' : '' }}">
            <a href="{{ route('instructor.credits') }}">
                <i class="site-menu-icon fas fa-hand-holding-usd" aria-hidden="true"></i>
                <span class="site-menu-title">Credits</span>
            </a>
        </li> -->
        <!-- <li class="site-menu-item {{ request()->is('instructor-withdraw-requests') ? 'active' : '' }}">
            <a href="{{ route('instructor.list.withdraw') }}">
                <i class="site-menu-icon wb-dashboard" aria-hidden="true"></i>
                <span class="site-menu-title">Withdraw Requests</span>
            </a>
        </li> -->
      </ul>


    </div>
  </div>
</div>
