@extends('layout.app')

@section('content')
<table id="table_id" class="display">
    <thead>
        <tr>
            <th>Title</th>
            <th>watched on</th>
            <th>Private</th>
            <th>Draft</th>
            <th>Garden Level</th>
            <th>Bed</th>
            <th>Owner</th>
            <th>Plant Height</th>
        </tr>
    </thead>
    <tbody>
        @foreach($data as $dream)
        <tr>
            <td>{{ $dream->title }}</td>
            <td>{{ $dream->watched_on }}</td>
            <td>{{ $dream->private == true ? 'Yes' : 'No' }}</td>
            <td>{{ $dream->draft == true ? 'Yes' : 'No' }}</td>
            <td>{{ $dream->garden_level }}</td>
            <td>{{ $dream->bed_no }}</td>
            <td>{{ $dream->name }}</td>
            <td>{{ $dream->height }}</td>
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
</script>
@endsection