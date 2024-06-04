<div>
    @include('components.alerts')
    
    <div class="login-box">
        <div class="login-logo">
            <a href="/"><b>Banya</b>Loc</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Войдите, чтобы начать сеанс</p>

                <form >
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Name" wire:model="name">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="Password" wire:model="password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <!-- /.col -->
                        <div class="col-4">
                            <button type="submit" class="btn btn-primary btn-block" wire:click.prevent="login">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <!-- /.social-auth-links -->

                <p class="mb-0 mt-2">

                    <a href="{{ route('register') }}" class="text-center" wire:navigate>Register a new employe</a>
                </p>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
</div>
