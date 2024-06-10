@extends('seller.layouts.app')
@section('main_content')
	<div class="page-content">
		<div class="container-fluid">

            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0">
                    {{translate($title)}}
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="{{route('seller.dashboard')}}">
                        {{translate('Home')}}
                        </a></li>
                        <li class="breadcrumb-item"><a href='{{route("seller.ticket.index")}}'>
                        {{translate('Tickets')}}
                        </a></li>
                        <li class="breadcrumb-item active">
                            {{translate("Ticket Details")}}
                        </li>
                    </ol>
                </div>
            </div>

            <div class="card">
                <div class="card-header border-bottom-dashed">
                    <div class="row g-4 align-items-center">
                        <div class="col-sm">
                            <div>
                                <h5 class="card-title mb-0">
                                    {{translate('Ticket Details')}}
                                </h5>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="card-body">
                    <div class="ticket-chat-wrapper p-3 bg-soft-gray rounded" data-simplebar>
                        <div class="d-flex align-items-center  gap-2 mb-2">
                            <div class="fs-4 lh-1">
                                @if($ticket->status == 1)
                                <span class="badge badge-soft-info">{{translate('Running')}}</span>
                                @elseif($ticket->status == 2)
                                    <span class="badge badge-soft-primary">{{translate('Answered')}}</span>
                                @elseif($ticket->status == 3)
                                    <span class="badge badge-soft-warning">{{translate('Replied')}}</span>
                                @elseif($ticket->status == 4)
                                    <span class="badge badge-soft-danger">{{translate('Closed')}}</span>
                                @endif
                            </div>

                            <small>{{translate('Ticket Number')}} - {{$ticket->ticket_number}}</small>
                        </div>

                        @foreach($ticket->messages as $meg)
                            <div class="row">
                                @if($meg->admin_id == 0)

                                <div class=" col-11 col-lg-6">
                                    <div class="border p-lg-3 p-2 rounded mt-3 bg-soft-white">
                                        <div class="text-start">
                                            @if($ticket->seller_id != null)
                                            <h6 class="text-primary mb-2">{{ $ticket->seller->email }}</h6>
                                            @endif
                                            <p class="mt
                                            -2 fs-12">{{ get_date_time($meg->created_at) }}</p>

                                        </div>
                                        <p class="p-2 mb-3 bg-light rounded">{{$meg->message }}</p>

                                        @if(count($meg->supportfiles) > 0)
                                            <div class="mt-3 d-flex flex-wrap gap-1">
                                                @foreach($meg->supportfiles as $key=> $file)
                                                    <a class=" d-inline-flex align-items-center gap-2 btn btn-sm btn-info" href="{{route('seller.ticket.file.download',encrypt($file->id))}}" ><i class="ri-download-2-line fs-14 lh-1 align-middle"></i>{{translate('File')}} {{++$key}}</a>
                                                @endforeach
                                            </div>
                                        @endif
                                    </div>
                                </div>

                                @else
                                <div class="col-11 offset-1 col-lg-6 offset-lg-6 text-end">
                                    <div class="border p-lg-3 p-2 rounded mt-3 bg-soft-white">
                                        <div class="text-end">
                                            <h6 class="m-0">{{translate('Admin Reply')}}</h6>
                                            <p>{{ get_date_time($meg->created_at) }}</p>
                                        </div>
                                        <p class="bg-light p-3 mb-3 rounded">{{$meg->message}}</p>
                                        @if(count($meg->supportfiles) > 0)
                                            <div class="mt-3 d-flex flex-wrap gap-1">
                                                @foreach($meg->supportfiles as $key=> $file)
                                                    <a href="{{route('seller.ticket.file.download',encrypt($file->id))}}" class="d-inline-flex align-items-center gap-2 btn btn-sm btn-info">
                                                        <i class="ri-download-2-line fs-14 lh-1 align-middle"></i>  {{translate('File')}} 	{{++$key}}

                                                    </a>
                                                @endforeach
                                            </div>
                                        @endif
                                    </div>
                                </div>

                                @endif
                            </div>
                        @endforeach
                    </div>
                    @if($ticket->status != 4)
                        <button class="btn btn-md btn-danger mt-4" data-bs-toggle="modal" data-bs-target="#close">
                            {{translate('Close Ticket')}}
                        </button>
                    @endif

                    @if($ticket->status != 4)
                        <form action="{{route('seller.ticket.reply', $ticket->id)}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="row g-4 my-3">
                                <div class="col-12">
                                    <textarea class="form-control" rows="5" name="message" placeholder="{{translate('Enter Message')}}" required>{{old('message')}}</textarea>
                                </div>

                                <div class="col-lg-10 col-md-9">
                                    <input type="file" name="file[]" class="form-control">
                                </div>

                                <div class="col-lg-2 col-md-3">
                                    <button type="button" class="btn btn-primary  waves ripple-light w-100 addnewfile">{{translate('Add New')}}</button>
                                </div>

                                <div class="addnewdata"></div>

                                <div class="col-12">
                                    <button type="submit" class="btn btn-md btn-success fs-6 px-4 ">{{translate('Reply')}}</button>
                                </div>
                            </div>
                        </form>
                    @endif
                </div>
            </div>
		</div>
	</div>

	<div class="modal fade zoomIn" id="close" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close"
						data-bs-dismiss="modal" aria-label="Close" >
                    </button>
				</div>

				<form action="{{route('seller.ticket.closed', $ticket->id)}}" method="post">
					@csrf
					<input type="hidden" name="id">
					<div class="modal-body">
						<div class="mt-2 text-center">
							<lord-icon src="{{asset('assets/global/gsqxdxog.json')}}" trigger="loop"
								colors="primary:#f7b84b,secondary:#f06548"
								class="loader-icon"

								></lord-icon>
							<div class="mt-4 pt-2 fs-15 mx-4 mx-sm-5">
								<h4>
								{{translate('Are you sure ?')}}
								</h4>
								<p class="text-muted mx-4 mb-0">
									{{translate('Are you sure you want to
									close this ticket ?')}}
								</p>
							</div>
						</div>
						<div class="d-flex gap-2 justify-content-center mt-4 mb-2">
							<button type="button" class="btn w-sm btn-danger"
								data-bs-dismiss="modal">
								{{translate('Close')}}

							</button>
							<button type="submit" class="btn w-sm btn-danger "
								id="delete-href">
								{{translate('Yes, Close It!')}}
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
@endsection

@push('script-push')
<script>
	"use strict"
	$('.addnewfile').on('click', function () {
        var html = `
        <div class="row mb-2 newdata">
    		<div class=" col-lg-10">
    			<input type="file" name="file[]" class="form-control" required>
			</div>

    		<div class="col-lg-2 text-right">
                <span class="input-group-btn">
                    <button class="btn btn-danger btn-md removeBtn " type="button">
						<i class="ri-delete-bin-fill"></i>
                    </button>
                </span>
            </div>
        </div>`;
        $('.addnewdata').append(html);
	    $(".removeBtn").on('click', function(){
	        $(this).closest('.newdata').remove();
	    });
    });
</script>
@endpush
