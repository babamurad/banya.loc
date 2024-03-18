<div>
    <div class="lockscreen-wrapper">
        @include('components.alerts')
        <div class="lockscreen-logo">
            <a href="/"><b>Banya</b>Loc</a>
        </div>
        <!-- User name -->
        <div class="lockscreen-name mb-4 ml-5 pl-5">
            <h6 class="pl-5">Имя: <strong>{{ auth()->user()->name }}</strong> </h6>
        </div>

        <!-- START LOCK SCREEN ITEM -->
        <div class="lockscreen-item">
            <!-- lockscreen image -->
            <div class="lockscreen-image">
                <img src="{{ asset('dist/img/avatar.png') }}" alt="User Image">
            </div>
            <!-- /.lockscreen-image -->

            <!-- lockscreen credentials (contains the form) -->
            <form class="lockscreen-credentials">
                <div class="input-group">
                    <input type="password" class="form-control" placeholder="password">

                    <div class="input-group-append">
                        <button type="button" class="btn">
                            <i class="fas fa-arrow-right text-muted"></i>
                        </button>
                    </div>
                </div>
            </form>
            <!-- /.lockscreen credentials -->

        </div>
        <!-- /.lockscreen-item -->
        <div class="help-block text-center">
            Подождите пока Администратор подтвердит вашу личность
        </div>
        <div class="text-center">
            <a href="{{ route('login') }}">Или авторизуйтесь другим пользователем</a>
        </div>
        <div class="lockscreen-footer text-center">
            Copyright © 2024 <b><a href="/" class="text-black">banya.loc</a></b><br>
            За права отвечаю
        </div>
    </div>
</div>
