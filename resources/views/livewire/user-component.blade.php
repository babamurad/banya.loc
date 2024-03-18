<div>
    <script>
        window.addEventListener('closeEditUserModal', event=> {
            $('#closeEditUserModal').modal('hide');
        })
    </script>
    <!--Modal -->
    @include('user.user-create')
    @include('user.user-edit')
    <!--Modal -->

    <section class="content-header">
        <div class="container-fluid">
            <div class="row">
                @include('components.alerts')
            </div>
          <div class="row mb-2">
            <div class="col-sm-4">
              <h1> {{__('User Tables')}} </h1>
            </div>
            <div class="col-md-4"></div>
            <div class="col-sm-4">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#"> {{__('Home')}} </a></li>
                <li class="breadcrumb-item active"> {{__('User Tables')}} </li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-2">
                    <button class="btn btn-block btn-primary"
                    data-toggle="modal" onClick="javascript:viewFile()" data-target="#CreateUserDialog">
                    <i class="fas fa-plus mr-1"></i> {{__('Add User')}}
                    </button>
                </div>
                <div class="col-md-6">

                </div>
                <div class="col-md-3">
                    <div class="input-group input-group-lg">
                        <input type="search" class="form-control form-control-lg" placeholder="Search..." wire:model.live.debounce.300ms='search'>
                        <div class="input-group-append ml-auto">
                            <button type="submit" class="btn btn-lg btn-default">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 ml-auto">
                    <div class="form-group" data-select2-id="29">
                        {{-- <label>Per Page</label> --}}
                        <select wire:model.live='perPage'
                        class="form-control select2 select2-hidden-accessible" style="width: 70%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
                        <option selected="selected" data-select2-id="5" value="5">5</option>
                        <option data-select2-id="10" value="10">10</option>
                        <option data-select2-id="20" value="20">20</option>
                        <option data-select2-id="40" value="40">40</option>
                        <option data-select2-id="50" value="50">50</option>
                        <option data-select2-id="100" value="100">100</option>
                        </select>
                    </div>
                </div>
        </div>
        </div>

        <!-- /.card-header -->
        <div class="card-body">
            <div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row"><div class="col-sm-12 col-md-6"></div><div class="col-sm-12 col-md-6"></div></div><div class="row"><div class="col-sm-12"><table id="example2" class="table table-bordered table-hover dataTable dtr-inline" aria-describedby="example2_info">
              <thead>
                <tr>
                    <th class="sorting sorting_asc" wire:click="setSortBy('name')">
                        <button class="btn btn-block btn-default">
                        <strong> {{__('Name')}} </strong>
                        @if($sortBy=='name') {!!$sortIcon!!} @else <i class="fas fa-sort ml-1"></i> @endif
                        </button>
                    </th>
                    <th class="sorting" wire:click="setSortBy('first_name')">
                        <button class="btn btn-block btn-default">
                            <strong> {{__('First Name')}} </strong>
                            @if($sortBy=='first_name') {!!$sortIcon!!} @else <i class="fas fa-sort ml-1"></i> @endif
                            </button>
                    </th>
                    <th class="sorting" wire:click="setSortBy('last_name')">
                        <button class="btn btn-block btn-default">
                            <strong> {{__('Last Name')}} </strong>
                            @if($sortBy=='last_name') {!!$sortIcon!!} @else <i class="fas fa-sort ml-1"></i> @endif
                            </button>
                    </th>
                    <th class="sorting" wire:click="setSortBy('email')">
                        <button class="btn btn-block btn-default">
                            <strong> {{__('Email')}} </strong>
                            @if($sortBy=='email') {!!$sortIcon!!} @else <i class="fas fa-sort ml-1"></i> @endif
                            </button>
                    </th>
                    <th class="sorting"> {{__('Action')}} </th>
                </tr>
            </thead>
              <tbody>
                    @forelse ($users as $user)
                    <tr wire:key="{{$user->id}}" class="odd">
                        <td class="dtr-control sorting_1" tabindex="0">{{$user->name}}</td>
                        <td>{{$user->first_name}}</td>
                        <td>{{$user->last_name}}</td>
                        <td>{{$user->email}}</td>
                        <td>
                            <div>
                                <button type="button" class="btn btn-secondary btn-sm"
                                data-toggle="modal" onClick="javascript:edit()" data-target="#closeEditUserModal" wire:click="edit({{ $user->id }})">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button onclick="confirm('Are you sure want to delete {{$user->name}}?') || event.stopImmediatePropagation() "
                                        type="button" class="btn btn-danger btn-sm" wire:click="delete({{$user->id}})">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </td>
                    </tr>

                    @empty
                    <p> {{__('Users table is Empty!')}} </p>
                    @endforelse

              </tbody>
              <tfoot>
                <tr>
                <th rowspan="1" colspan="1"> {{__('Name')}} </th>
                <th rowspan="1" colspan="1"> {{__('First Name')}} </th>
                <th rowspan="1" colspan="1"> {{__('Last Name')}} </th>
                <th rowspan="1" colspan="1"> {{__('Email')}} </th>
                <th rowspan="1" colspan="1"><span>
                    {{$us_count}} {{__('rows')}}
                </span></th>
                </tr>
            </tfoot>
            </table>
            {{$users->links()}}

          </div>
        <!-- /.card-body -->
      </div>
    </div>

</div>
