<div>
    <script>
        window.addEventListener('closeModal', event=> {
            $('#CreateEmploye').modal('hide');
        });
        window.addEventListener('closeJobTitleModal', event=> {
            $('#CreateJobTitleDialog').modal('hide');
        });
    </script>
    <!--Modal -->
    @include('jobtitle.jobtitle-create')
    @include('jobtitle.jobtitle-edit')
    @include('jobtitle.employe-create')
    <!--Modal -->

    <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-3">
              <h1> {{ __('Job Titles Tables') }} </h1>
            </div>
            <div class="col-md-6">@include('components.alerts')</div>
            <div class="col-sm-3">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#"> {{__('Home')}} </a></li>
                <li class="breadcrumb-item active"> {{__('Job Titles Tables')}} </li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-2">
                    <label for=""></label>
                    <button class="btn btn-block btn-success"
                    data-toggle="modal" data-target="#CreateJobTitleDialog">
                    <i class="fas fa-plus mr-1"></i> {{__('Add Job Titles')}}
                    </button>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Select Employe</label>
                        <button class="btn btn-sm text-green" data-toggle="modal" data-target="#CreateEmploye"><i class="fas fa-plus"></i>
                        </button>
                        <select class="form-control" wire:model.live="employe_id">
                            <option value="" selected>Все</option>
                            @foreach($employes as $employe)
                            <option wire:key="{{ $employe->id }}" value="{{ $employe->id }}">{{ $employe->first_name }} {{ $employe->last_name }}</option>
                            @endforeach
                        </select>

                    </div>

                </div>
                {{-- <div class="col-md-2">
                    @if ($search)
                    <div class="alert alert-info alert-dismissible" style="height: 3rem;">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5><i class="fas fa-search"></i> {{$search}}</h5>
                    </div>

                    @endif
                </div> --}}
                {{-- <div class="col-md-3">
                    <div class="input-group input-group-lg">
                        <input type="search" class="form-control form-control-lg" placeholder=" {{__('Search...')}} "  wire:model.live.debounce.300ms='search'>
                        <div class="input-group-append ml-auto">
                            <button type="submit" class="btn btn-lg btn-default">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div> --}}
                <div class="col-md-2 ml-auto">
                    <div class="form-group" data-select2-id="29">
                        <label>Per Page</label>
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

            <div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row"><div class="col-sm-12 col-md-6"></div><div class="col-sm-12 col-md-6"></div></div><div class="row"><div class="col-sm-12">
            <table id="example2" class="table table-bordered table-hover dataTable dtr-inline" aria-describedby="example2_info">
              <thead>
                <tr>
                    <th class="sorting sorting_asc" wire:click="setSortBy('id')">
                        <button class="btn btn-block btn-default">
                        <strong> {{__('ID')}} </strong>
                        @if($sortBy=='id') {!!$sortIcon!!} @else <i class="fas fa-sort ml-1"></i> @endif
                        </button>
                    </th>
                    <th class="sorting sorting_asc" wire:click="setSortBy('name')">
                        <button class="btn btn-block btn-default">
                        <strong> {{__('Service Name')}} </strong>
                        @if($sortBy=='name') {!!$sortIcon!!} @else <i class="fas fa-sort ml-1"></i> @endif
                        </button>
                    </th>
                    <th class="sorting" wire:click="setSortBy('qty')">
                        <button class="btn btn-block btn-default">
                            <strong> {{__('Quantity')}} </strong>
                            @if($sortBy=='qty') {!!$sortIcon!!} @else <i class="fas fa-sort ml-1"></i> @endif
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
                    @forelse ($jobtitles as $jobtitle)
                    <tr wire:key="{{$jobtitle->id}}" class="odd">
                        <td>{{$jobtitle->id}}</td>
                        <td>{{$jobtitle->name}}</td>
                        <td>{{$jobtitle->qty}} </td>
                        <td>{{$jobtitle->price}} {{__('man.')}} </td>
                        <td>
                            <div>
                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal"
                                data-target="#EditJobTitleDialog" wire:click='edit({{$jobtitle->id}})'>
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button onclick="confirm('Are you sure want to delete {{$jobtitle->name}}?') || event.stopImmediatePropagation() "
                                    type="button" class="btn btn-danger btn-sm" wire:click="destroy({{$jobtitle->id}})">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </td>
                    </tr>

                    @empty
                    <p> {{__('Job Titles table is Empty!')}} </p>
                    @endforelse

              </tbody>
              <tfoot>
                <tr>
                <th rowspan="1" colspan="1"> {{__('Id')}} </th>
                <th rowspan="1" colspan="1"> {{__('Service Name')}} </th>
                <th rowspan="1" colspan="1"> {{__('Quantity')}} </th>
                <th rowspan="1" colspan="1"> {{__('Price')}} </th>
                <th rowspan="1" colspan="1"><span>
                    {{ $jobtitles->count() }} {{__('rows')}}
                </span></th>
                </tr>
            </tfoot>
            </table>
{{ $jobtitles->links() }}

          </div>
        <!-- /.card-body -->
      </div>
    </div>


</div>
