<div>
    @include('components.alerts')
    <div class="register-box">
        <div class="register-logo">
            <a href="/"><b>Banya</b>Loc</a>
        </div>

        <div class="card">
            <div class="card-body register-card-body">
                <p class="login-box-msg">Register a new membership</p>

                <form>
                    <div class="input-group mb-3">
                        <input type="text" name="firstname" class="form-control @error('firstname') is-invalid @enderror" placeholder="First Name" wire:model="firstname">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" name="lastname" class="form-control @error('lastname') is-invalid @enderror" placeholder="Last Name" wire:model="lastname">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" placeholder="Email" wire:model="email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
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
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="Retype password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">

                        </div>
                        <!-- /.col -->
                        <div class="col-4">
                            <button class="btn btn-primary btn-block" wire:click.prevent="registerUser">Register</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <a href="{{ route('login') }}" class="text-center pt-2" wire:navigate>I already have a membership</a>
            </div>
            <!-- /.form-box -->
        </div><!-- /.card -->
    </div>
</div>
