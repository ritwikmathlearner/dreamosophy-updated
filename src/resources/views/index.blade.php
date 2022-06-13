@extends('layout.app')

@section('title', 'Admin - User')

@section('content')
<table id="table_id" class="display">
    <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Level</th>
            <th>Hoots</th>
            @if($_SERVER['REQUEST_METHOD'] != 'POST')
            <th>Dream Count</th>
            @endif
            <th>Social Meida</th>
            <th>Ratings</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        @if(isset($msg))
        <p class="p-3 text-center text-success">{{ $msg }}</p>
        @endif
        @foreach($data as $user)
        @php $user = ((object) $user) @endphp
        <tr>
            <td class="d-flex align-items-center">
                {{ $user->name }}
                @if($_SERVER['REQUEST_METHOD'] != 'POST')
                <form action="{{ route('web.friends') }}" method="POST">
                    @csrf
                    <input type="hidden" name="user_id" value="{{ $user->id }}">
                    <button class="btn text-primary" type="submit" title="Friend List"><i class="bi bi-people-fill"></i></button>
                </form>
                @endif
            </td>
            <td>{{ $user->email }}</td>
            <td>{{ $user->experience_level }}</td>
            <td>
                <span class="d-none">{{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'hoots']) }}</span>
                <form action="{{ route('web.hoots') }}" method="POST" name="hoots-change">
                    @csrf
                    <input type="hidden" name="user_id" value="{{ $user->id }}">
                    <input type="text" name="hoots" id="hoots" class="form-control w-50" value="{{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'hoots']) }}">
                </form>
            </td>
            @if($_SERVER['REQUEST_METHOD'] != 'POST')
            <td>{{ $user->dreams()->count() }}</td>
            @endif
            <td>
                @if(getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'facebook_url']))
                <a target="_blank" href="https://{{ (getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'facebook_url'])) }}">Facebook</a>
                @endif
                @if(getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'linkedin_url']))
                <a target="_blank" href="https://{{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'linkedin_url']) }}">Linkedin</a>
                @endif
                @if(getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'tiktok_url']))
                <a target="_blank" href="https://{{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'tiktok_url']) }}">TikTok</a>
                @endif
            </td>
            <td>
                <span class="d-none">{{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'rating']) }}</span>
                <form action="{{ route('web.ratings') }}" method="POST" name="rating-change">
                    @csrf
                    <input type="hidden" name="user_id" value="{{ $user->id }}">
                    <select name="ratings" id="ratings" class="form-control ratings" onchange="this.form.submit()">
                        <option disabled value="0" {{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'ratings']) == 0 ? 'selected' : '' }}>0</option>
                        <option value="1" {{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'rating']) == 1 ? 'selected' : '' }}>1</option>
                        <option value="2" {{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'rating']) == 2 ? 'selected' : '' }}>2</option>
                        <option value="3" {{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'rating']) == 3 ? 'selected' : '' }}>3</option>
                        <option value="4" {{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'rating']) == 4 ? 'selected' : '' }}>4</option>
                        <option value="5" {{ getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'rating']) == 5 ? 'selected' : '' }}>5</option>
                    </select>
                </form>
            </td>
            <td>
                <form action="{{ route('web.users.change.status') }}" method="POST">
                    @csrf
                    <input type="hidden" name="user_id" value="{{ $user->id }}">
                    @if(empty(getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'banned'])))
                    <button class="btn text-danger" type="submit" title="Ban"><i class="bi bi-shield-x"></i></button>
                    @else
                    <button class="btn text-success" type="submit" title="Remove Ban"><i class="bi bi-shield-check"></i></button>
                    @endif
                </form>

            </td>
        </tr>
        @endforeach
    </tbody>
</table>
@endsection

@section('script')
<script>
    $(document).ready(function() {
        $('#table_id').DataTable();
    });

    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })

    function updateRatings(event, userId) {
        console.log(userId, event.target.value)
    }
</script>
@endsection