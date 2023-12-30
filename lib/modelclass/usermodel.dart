// class Leads {
//   bool? success;
//   Data? data;
//   String? message;
//   Null? errors;
//
//   Leads({this.success, this.data, this.message, this.errors});
//
//   Leads.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//     errors = json['errors'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     data['errors'] = this.errors;
//     return data;
//   }
// }
//
// class Data {
//   List<Leads>? leads;
//   int? totalCount;
//   int? totalPage;
//   Null? nextPageNo;
//   Null? previousPageNo;
//   int? currentPage;
//
//   Data(
//       {this.leads,
//         this.totalCount,
//         this.totalPage,
//         this.nextPageNo,
//         this.previousPageNo,
//         this.currentPage});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['leads'] != null) {
//       leads = <Leads>[];
//       json['leads'].forEach((v) {
//         leads!.add(new Leads.fromJson(v));
//       });
//     }
//     totalCount = json['total_count'];
//     totalPage = json['total_page'];
//     nextPageNo = json['next_page_no'];
//     previousPageNo = json['previous_page_no'];
//     currentPage = json['current_page'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.leads != null) {
//       data['leads'] = this.leads!.map((v) => v.toJson()).toList();
//     }
//     data['total_count'] = this.totalCount;
//     data['total_page'] = this.totalPage;
//     data['next_page_no'] = this.nextPageNo;
//     data['previous_page_no'] = this.previousPageNo;
//     data['current_page'] = this.currentPage;
//     return data;
//   }
// }
//
// class Leads {
//   int? id;
//   Null? source;
//   String? createdUser;
//   String? assignedUser;
//   String? createdAt;
//   String? updatedAt;
//   String? name;
//   String? mobile;
//   String? email;
//   Null? image;
//   String? interest;
//   String? location;
//   bool? isAssigned;
//   String? status;
//   String? priority;
//   int? fkCompany;
//   int? createdBy;
//
//   Leads(
//       {this.id,
//         this.source,
//         this.createdUser,
//         this.assignedUser,
//         this.createdAt,
//         this.updatedAt,
//         this.name,
//         this.mobile,
//         this.email,
//         this.image,
//         this.interest,
//         this.location,
//         this.isAssigned,
//         this.status,
//         this.priority,
//         this.fkCompany,
//         this.createdBy});
//
//   Leads.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     source = json['source'];
//     createdUser = json['created_user'];
//     assignedUser = json['assigned_user'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     name = json['name'];
//     mobile = json['mobile'];
//     email = json['email'];
//     image = json['image'];
//     interest = json['interest'];
//     location = json['location'];
//     isAssigned = json['is_assigned'];
//     status = json['status'];
//     priority = json['priority'];
//     fkCompany = json['fk_company'];
//     createdBy = json['created_by'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['source'] = this.source;
//     data['created_user'] = this.createdUser;
//     data['assigned_user'] = this.assignedUser;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['name'] = this.name;
//     data['mobile'] = this.mobile;
//     data['email'] = this.email;
//     data['image'] = this.image;
//     data['interest'] = this.interest;
//     data['location'] = this.location;
//     data['is_assigned'] = this.isAssigned;
//     data['status'] = this.status;
//     data['priority'] = this.priority;
//     data['fk_company'] = this.fkCompany;
//     data['created_by'] = this.createdBy;
//     return data;
//   }
// }
