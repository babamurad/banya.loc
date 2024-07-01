<div>
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-4">
                    <h1> Смены кассиров </h1>
                </div>
                <div class="col-md-4">

                </div>
                <div class="col-sm-4">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('admin') }}"> Главная </a></li>
                        <li class="breadcrumb-item active"> Смены кассиров </li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <div class="card">
        <div class="card-header">
            <h4>Закрытие смены</h4>
        </div>
        <div class="card-body">
            <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label>Кассиры</label>
                    <select class="form-control" @readonly(true)>
                        @foreach ($users as $user)
                        <option value="{{ $user->id }}">{{ $user->first_name . ' ' . $user->last_name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="start">Дата: </label><br>
                    <input type="date" id="start" name="trip-start" style="width: 50%;" 
                    value="{{ \Carbon\Carbon::create(now())->format('Y-m-d') }}"
                    min="2024-01-01"
                    max="2024-12-31" />
                </div>
            </div>

            <div class="col-sm-2">
                <div class="form-group">
                    <label>Смена</label>
                    <select class="form-control" wire:model.live="time">
                        <option value="6">06:00 - 10:00</option>
                        <option value="10">10:00 - 16:30</option>
                        <option value="16">16:30 - 22:30</option>
                    </select>
                </div>
            </div>

            <div class="col-sm-2">
                <div class="form-group">
                <label class="mb-1" for="smena"></label><br>
                <button name="smena" class="btn btn-primary mt-2">Расчитать</button>
                </div>
            </div>
            </div>
            @php
                $totalSum = 0;
            @endphp
            <div class="row">
                <div class="col-sm-8">
                    <div class="form-group d-flex">
                        @foreach($departments as $department)
                            <ul>
                                <li wire:key='{{$department->id}}'>
                                    <strong>{{$department->name}}</strong>                                      
                                    @php
                                       $totalSum = $totalSum + $department->total_sum; 
                                    @endphp
                                </li>
                                <li class="text-success"><strong>{{$department->total_sum}}</strong></li>
                            </ul>
                        @endforeach
                    </div>
                </div>
                <div class="col-sm-4"><br>
                    <div class="form-group">
                        <strong>Общая сумма за смену: </strong><strong class="text-success"> {{ $totalSum }} man.</strong>
                    </div>
                </div>
            </div>
            <div class="row">

            </div>
        </div>

    </div>

    <div class="card">
        <div class="card-header">
          <h3 class="card-title">Смены</h3>

          <div class="card-tools">
            <div class="input-group input-group-sm" style="width: 150px;">
              <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

              <div class="input-group-append">
                <button type="submit" class="btn btn-default">
                  <i class="fas fa-search"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body table-responsive p-0">
          <table class="table table-hover text-nowrap">
            <thead>
              <tr>
                <th>ID</th>
                <th>Кассир</th>
                <th>Дата</th>
                <th>Статус</th>
                <th>Сумма</th>
                <th> {{__('Action')}} </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>183</td>
                <td>John Doe</td>
                <td>11-7-2014</td>
                <td><span class="tag tag-success">Approved</span></td>
                <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                <td><td>
                      <div>
                          <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal"
                                  data-target="#EditJobTitleDialog">
                              <i class="fas fa-edit"></i>
                          </button>
                          <button type="button" class="btn btn-danger btn-sm">
                              <i class="fas fa-trash-alt"></i>
                          </button>
                      </div>
                  </td></td>
              </tr>
              <tr>
                <td>219</td>
                <td>Alexander Pierce</td>
                <td>11-7-2014</td>
                <td><span class="tag tag-warning">Pending</span></td>
                <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
              </tr>
              <tr>
                <td>657</td>
                <td>Bob Doe</td>
                <td>11-7-2014</td>
                <td><span class="tag tag-primary">Approved</span></td>
                <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
              </tr>
              <tr>
                <td>175</td>
                <td>Mike Doe</td>
                <td>11-7-2014</td>
                <td><span class="tag tag-danger">Denied</span></td>
                <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
              </tr>
            </tbody>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
</div>
