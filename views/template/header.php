<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
 <div class="container-fluid">
   <a class="navbar-brand" href="#">Brand</a>
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"  aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  <div class="collapse navbar-collapse" id="main_nav">
  <ul class="navbar-nav">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"> Mega submenu </a>
        <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#"> Dropdown item 1 </a></li>
        <li><a class="dropdown-item" href="#"> Dropdown item 2 </a></li>
        <li><a class="dropdown-item" href="#"> Dropdown item 3 </a></li>
        <li class="has-megasubmenu">
           <a class="dropdown-item" href="#"> Dropdown item 4 &raquo; </a>
           <div class="megasubmenu dropdown-menu">
           <div class="row">
                    <div class="col-6">
                          <h6 class="title">Title Menu One</h6>
                            <ul class="list-unstyled">
                                <li><a href="#">Custom Menu</a></li>
                                <li><a href="#">Custom Menu</a></li>
                                <li><a href="#">Custom Menu</a></li>
                                <li><a href="#">Custom Menu</a></li>
                                <li><a href="#">Custom Menu</a></li>
                            </ul>
                    </div><!-- end col-3 -->
                    <div class="col-6">
                        <h6 class="title">Title Menu Two</h6>
                            <ul class="list-unstyled">
                                <li><a href="#">Custom Menu</a></li>
                                <li><a href="#">Custom Menu</a></li>
                                <li><a href="#">Custom Menu</a></li>
                                <li><a href="#">Custom Menu</a></li>
                            </ul>
                    </div><!-- end col-3 -->
                </div><!-- end row -->
         </div>
        </li>
        <li class="has-megasubmenu">
           <a class="dropdown-item" href="#"> Dropdown item 5 &raquo; </a>
           <div class="megasubmenu dropdown-menu">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
            proident, sunt in culpa qui officia deserunt mollit anim id est laborum. 
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
            consequat.
         </div>
        </li>
        <li><a class="dropdown-item" href="#"> Dropdown item 6 </a></li>
        </ul>
    </li>
    <li class="nav-item"> <a class="nav-link" href="#">Menu item </a> </li>
    <li class="nav-item"><a class="nav-link" href="#"> About </a></li>
    <li class="nav-item"><a class="nav-link" href="#"> Services </a></li>
  </ul>

  <ul class="navbar-nav ms-auto">
    <li class="nav-item"><a class="nav-link" href="#"> Menu item </a></li>
    <li class="nav-item"><a class="nav-link" href="#"> Menu item </a></li>
    <li class="nav-item dropdown">
      <a class="nav-link  dropdown-toggle" href="#" data-bs-toggle="dropdown"> Dropdown right </a>
        <ul class="dropdown-menu dropdown-menu-end">
        <li><a class="dropdown-item" href="#"> Submenu item 1</a></li>
        <li><a class="dropdown-item" href="#"> Submenu item 2 </a></li>
        </ul>
    </li>
  </ul>
  </div> <!-- navbar-collapse.// -->
 </div> <!-- container-fluid.// -->
</nav>

<script type="text/javascript">
    window.addEventListener("resize", function() {
    "use strict"; window.location.reload(); 
  });


  document.addEventListener("DOMContentLoaded", function(){
        
        /////// Prevent closing from click inside dropdown
    document.querySelectorAll('.dropdown-menu').forEach(function(element){
      element.addEventListener('click', function (e) {
        e.stopPropagation();
      });
    });

    // make it as accordion for smaller screens
    if (window.innerWidth < 992) {

      // close all inner dropdowns when parent is closed
      document.querySelectorAll('.navbar .dropdown').forEach(function(everydropdown){
        everydropdown.addEventListener('hidden.bs.dropdown', function () {
          // after dropdown is hidden, then find all submenus
            this.querySelectorAll('.megasubmenu').forEach(function(everysubmenu){
              // hide every submenu as well
              everysubmenu.style.display = 'none';
            });
        })
      });

      document.querySelectorAll('.has-megasubmenu a').forEach(function(element){
        element.addEventListener('click', function (e) {
    
            let nextEl = this.nextElementSibling;
            if(nextEl && nextEl.classList.contains('megasubmenu')) {  
              // prevent opening link if link needs to open dropdown
              e.preventDefault();

              if(nextEl.style.display == 'block'){
                nextEl.style.display = 'none';
              } else {
                nextEl.style.display = 'block';
              }

            }
        });
      })
    }
    // end if innerWidth
  }); 
  // DOMContentLoaded  end
</script>


<style type="text/css">
  <style type="text/css">

.megasubmenu{ padding:1rem; }

/* ============ desktop view ============ */
@media all and (min-width: 992px) {
  .megasubmenu{ 
    left:100%; top:0; min-height: 100%; min-width:500px;
  }
  
  .dropdown-menu > li:hover .megasubmenu{
    display: block;
  }
} 
/* ============ desktop view .end// ============ */

</style>
</style>