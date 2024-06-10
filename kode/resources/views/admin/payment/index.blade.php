@extends('admin.layouts.app')
@section('main_content')
<div class="page-content">
	<div class="container-fluid">

        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0">
                {{translate($title)}}
            </h4>
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">
                        {{translate('Home')}}
                    </a></li>
                    <li class="breadcrumb-item active">
                        {{translate('Payment Methods')}}
                    </li>
                </ol>
            </div>
        </div>


		<div class="card">
			<div class="card-header border-0">
				<div class="row g-4 align-items-center">
					<div class="col-sm">
						<div>
							<h5 class="card-title mb-0">
								{{translate('Payment Method List')}}
							</h5>
						</div>
					</div>
				</div>
			</div>

			<div class="card-body border border-dashed border-end-0 border-start-0">
				<form action="{{route('admin.gateway.payment.method')}}" method="get">
					<div class="row g-3">
						<div class="col-xl-4 col-sm-6">
							<div class="search-box">
								<input type="text" name="search" value="{{request()->input('search')}}" class="form-control search"
									placeholder="Search by Name">
								<i class="ri-search-line search-icon"></i>
							</div>
						</div>

						<div class="col-xl-2 col-sm-3 col-6">
							<div>
								<button type="submit" class="btn btn-primary w-100 waves ripple-light"> <i
										class="ri-equalizer-fill me-1 align-bottom"></i>
									{{translate('Search')}}
								</button>
							</div>
						</div>

						<div class="col-xl-2 col-sm-3 col-6">
							<div>
								<a href="{{route('admin.gateway.payment.method')}}" class="btn btn-danger w-100 waves ripple-light"> <i
										class="ri-refresh-line me-1 align-bottom"></i>
									{{translate('Reset')}}
								</a>
							</div>
						</div>

					</div>
				</form>
			</div>

			<div class="card-body px-0 pt-0">
				<div class="table-responsive">
					<table class="table table-hover table-centered align-middle table-nowrap">
						<thead class="text-muted table-light">
							<tr>
								<th scope="col">#</th>
								<th scope="col">
									{{translate('Name')}}
								</th>
								<th scope="col">
									{{translate('Method Currency')}}
								</th>
								<th scope="col">
									{{translate('Status')}}
								</th>
								<th scope="col" class="text-center">
									{{translate('Options')}}
								</th>
							</tr>
						</thead>

						<tbody>
							@forelse($paymentMethods as $paymentMethod)
								<tr>
									<td class="fw-medium">
									    {{$loop->iteration}}
									</td>

									<td>
										<div class="d-flex align-items-center">
											<div class="flex-shrink-0 me-2">
												<img class="rounded avatar-sm img-thumbnail" src="{{ show_image(file_path()['payment_method']['path'].'/'.$paymentMethod->image,file_path()['payment_method']['size'])}}" alt="{{$paymentMethod->image}}"
												>
											</div>
											<div class="flex-grow-1">
												{{$paymentMethod->name}}
											</div>
										</div>
									</td>

									<td>
										{{@$paymentMethod->currency->name}}
									</td>

									<td>
										@if($paymentMethod->status == 1)
										    <span class="badge badge-soft-success">{{translate('Active')}}</span>
										@else
											<span class="badge badge-soft-danger">{{translate('Inactive')}}</span>
										@endif
									</td>

									<td>
										<div class="hstack justify-content-center gap-3">
											@if(permission_check('update_method'))
												<a title="{{translate('Update')}}" data-bs-toggle="tooltip" data-bs-placement="top" href="{{route('admin.gateway.payment.edit', [make_slug($paymentMethod->name), $paymentMethod->id])}}" class="pointer fs-19 link-warning">
													<i class="ri-pencil-fill"></i>
												</a>
											@endif
										</div>
									</td>
								</tr>
							@empty
								<tr>
									<td class="border-bottom-0" colspan="100">
										@include('admin.partials.not_found')
									</td>
								</tr>
							@endforelse
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection


