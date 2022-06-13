@extends('layout.app')

@section('content')
<table id="table_id" class="display">
    <thead>
        <tr>
            <th>Comment</th>
            <th>Posted on</th>
            <th>Posted by</th>
            <th>Dream title</th>
            <th>Bad Word Count</th>
        </tr>
    </thead>
    <tbody>
        @foreach($data as $comment)
        <tr>
            <td>{{ $comment->comment }}</td>
            <td>{{ $comment->created_at }}</td>
            <td>{{ $comment->name }}</td>
            <td>{{ $comment->title }}</td>
            <td>{{ $comment->bad_comment_intensity }}</td>
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