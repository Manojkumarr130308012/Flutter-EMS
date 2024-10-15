import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:oriens_eam/features/4_service_request/service_request_data/service_request.dart';

class ServiceRequestDetailsPage extends StatefulWidget {
  final ServiceRequest serviceRequest;

  const ServiceRequestDetailsPage({super.key, required this.serviceRequest});

  @override
  State<ServiceRequestDetailsPage> createState() =>
      _ServiceRequestDetailsPageState();
}

class _ServiceRequestDetailsPageState extends State<ServiceRequestDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          widget.serviceRequest.serviceRequestName ?? '',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            /////////////////////////// WORK ORDER Code \\\\\\\\\\\\\\\\\\\\\\\\\\
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '#${widget.serviceRequest.code}' ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* ------------------ Status & date ------------------ */
                Row(
                  children: [
                    const Text(
                      "Status: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      widget.serviceRequest.status ?? '',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "Request Date: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      DateFormat.yMMMd()
                          .format(widget.serviceRequest.requestedDate!),
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(),
            /////////////////////////// Primary Information (Key Details)  \\\\\\\\\\\\\\\\\\\\\\\\\\
            Row(
              children: [
                const Text(
                  "Work Type: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.workType ?? "",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Location: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.locationName ?? "",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Asset Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.assetName ?? "",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Failure Class: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.failureClassName ?? "",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            const Divider(),
            ///////////////////////////  Problem Summary \\\\\\\\\\\\\\\\\\\\\\\\\\
            Row(
              children: [
                const Text(
                  "Problem: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.problemName ?? "",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Description: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.description ?? "",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            const Divider(),
            /////////////////////////// Dates \\\\\\\\\\\\\\\\\\\\\\\\\\
            Row(
              children: [
                const Text(
                  "Requested Date: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  DateFormat.yMMMd()
                      .add_Hms()
                      .format(widget.serviceRequest.requestedDate!),
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Start Date: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  DateFormat.yMMMd()
                      .add_Hms()
                      .format(widget.serviceRequest.stopBeginDate!),
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "End Date: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  DateFormat.yMMMd()
                      .add_Hms()
                      .format(widget.serviceRequest.closingDate!),
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            const Divider(),
            /////////////////////////// ID's \\\\\\\\\\\\\\\\\\\\\\\\\\

            // Row(
            //   children: [
            //     const Text(
            //       "Failure Class ID: ",
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //     const Spacer(),
            //     Text(
            //       widget.serviceRequest.failureClassId ?? "",
            //       style: TextStyle(color: Colors.grey.shade600),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                const Text(
                  "Problem ID: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.problemId ?? "",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Location ID: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.locationId ?? "",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Asset ID: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.assetId ?? "",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            const Divider(),
            /////////////////////////// Last status \\\\\\\\\\\\\\\\\\\\\\\\\\
            Row(
              children: [
                const Text(
                  "Created Date: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  DateFormat.yMMMd()
                      .add_Hms()
                      .format(widget.serviceRequest.requestedDate!),
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Active: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.isActive ?? false ? "yes" : "No",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Deleted: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.serviceRequest.isDeleted ?? false ? "yes" : "No",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
