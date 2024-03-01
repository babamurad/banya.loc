<div>
    <!--Modal -->
@include('department.create-department')
@include('department.edit-department')
<!--Modal -->
{{--    <div class="container">--}}
{{--        @include('components.alerts')--}}
{{--    </div>--}}
    <script>
        window.addEventListener('closeCreateModal', event=> {
            $('#CreateDepartment').modal('hide');
        })
        window.addEventListener('closeEditModal', event=> {
            $('#EditDepartment').modal('hide');
        })
    </script>

    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-4">
                    <h1> {{ __('Отделы') }} </h1>
                </div>
                <div class="col-md-4">
                    @include('components.alerts')
                </div>
                <div class="col-sm-4">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#"> {{__('Home')}} </a></li>
                        <li class="breadcrumb-item active"> {{__('Clients Tables')}} </li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-2">
                    <button class="btn btn-block btn-success"
                            data-toggle="modal" data-target="#CreateDepartment">
                        <i class="fas fa-plus mr-1"></i> {{__('Добавить отдел')}}
                    </button>
                </div>
                <div class="col-md-4"></div>
                <div class="col-md-2">
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-1 ml-auto">
                </div>
            </div>
        </div>

        <!-- /.card-header -->
        <div class="card-body">
            <div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
                <div class="row"><div class="col-sm-12 col-md-6"></div>
                    <div class="col-sm-12 col-md-6"></div></div>
                <div class="row"><div class="col-sm-12"><table id="example2" class="table table-bordered table-hover dataTable dtr-inline" aria-describedby="example2_info">
                            <thead>
                            <tr>
                                <th class="sorting" wire:click="setSortBy('id')">
                                    <button class="btn btn-block btn-default">
                                        <strong> {{__('Id')}} </strong>
                                        @if($sortBy=='id') {!!$sortIcon!!} @else <i class="fas fa-sort ml-1"></i> @endif
                                    </button>
                                </th>
                                <th class="sorting sorting_asc" wire:click="setSortBy('name')">
                                    <button class="btn btn-block btn-default">
                                        <strong> {{__('Название')}} </strong>
                                        @if($sortBy=='name') {!!$sortIcon!!} @else <i class="fas fa-sort ml-1"></i> @endif
                                    </button>
                                </th>
                                <th class="sorting" wire:click="setSortBy('price')">
                                    <button class="btn btn-block btn-default">
                                        <strong> {{__('Price')}} </strong>
                                        @if($sortBy=='price') {!!$sortIcon!!} @else <i class="fas fa-sort ml-1"></i> @endif
                                    </button>
                                </th>
                                <th class="sorting"> {{__('Action')}} </th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse ($departments as $department)
                                <tr wire:key="{{$department->id}}" class="odd">
                                    <td>{{$department->id}}</td>
                                    <td>{{$department->name}}</td>
                                    <td>{{$department->price}}</td>
                                    <td>
                                        <div>
                                            <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal"
                                                    data-target="#EditDepartment" wire:click='edit({{ $department->id}})'>
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button onclick="confirm('Are you sure want to delete {{$department->name}}?') || event.stopImmediatePropagation() " type="button"
                                                    class="btn btn-danger btn-sm" wire:click="delete({{$department->id}})">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>

                            @empty
                                <p> {{__('Departments table is Empty!')}} </p>
                            @endforelse

                            </tbody>
                            <tfoot>
                            <tr>
                                <th rowspan="1" colspan="1"> {{__('Id')}} </th>
                                <th rowspan="1" colspan="1"> {{__('Name')}} </th>
                                <th rowspan="1" colspan="1"> {{__('Price')}} </th>
                                <th rowspan="1" colspan="1"></th>
                            </tr>
                            </tfoot>
                        </table>
                        {{$departments->links()}}

                    </div>
                </div>
                    <!-- /.card-body -->
                </div>
            </div>


        </div>

