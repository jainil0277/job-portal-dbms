--
-- PostgreSQL database dump
--

\restrict uOguWqQ3b35D4m3qBLeF1abEv9cmFII2Bu4RItpgdgzhQ7XYDa2ScNtRZvEZNNj

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: candidate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.candidate (candidateid, name, email, phone, headline, summary, location, experiencelevel, profilevisibility) FROM stdin;
CAN-001	Candidate Name 1	candidate1@gmail.com	+919876500001	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-002	Candidate Name 2	candidate2@gmail.com	+919876500002	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-003	Candidate Name 3	candidate3@gmail.com	+919876500003	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-004	Candidate Name 4	candidate4@gmail.com	+919876500004	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-005	Candidate Name 5	candidate5@gmail.com	+919876500005	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-006	Candidate Name 6	candidate6@gmail.com	+919876500006	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-007	Candidate Name 7	candidate7@gmail.com	+919876500007	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-008	Candidate Name 8	candidate8@gmail.com	+919876500008	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-009	Candidate Name 9	candidate9@gmail.com	+919876500009	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-010	Candidate Name 10	candidate10@gmail.com	+919876500010	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-011	Candidate Name 11	candidate11@gmail.com	+919876500011	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-012	Candidate Name 12	candidate12@gmail.com	+919876500012	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-013	Candidate Name 13	candidate13@gmail.com	+919876500013	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-014	Candidate Name 14	candidate14@gmail.com	+919876500014	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-015	Candidate Name 15	candidate15@gmail.com	+919876500015	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-016	Candidate Name 16	candidate16@gmail.com	+919876500016	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-017	Candidate Name 17	candidate17@gmail.com	+919876500017	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-018	Candidate Name 18	candidate18@gmail.com	+919876500018	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-019	Candidate Name 19	candidate19@gmail.com	+919876500019	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-020	Candidate Name 20	candidate20@gmail.com	+919876500020	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-021	Candidate Name 21	candidate21@gmail.com	+919876500021	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-022	Candidate Name 22	candidate22@gmail.com	+919876500022	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-023	Candidate Name 23	candidate23@gmail.com	+919876500023	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-024	Candidate Name 24	candidate24@gmail.com	+919876500024	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-025	Candidate Name 25	candidate25@gmail.com	+919876500025	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-026	Candidate Name 26	candidate26@gmail.com	+919876500026	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-027	Candidate Name 27	candidate27@gmail.com	+919876500027	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-028	Candidate Name 28	candidate28@gmail.com	+919876500028	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-029	Candidate Name 29	candidate29@gmail.com	+919876500029	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-030	Candidate Name 30	candidate30@gmail.com	+919876500030	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-031	Candidate Name 31	candidate31@gmail.com	+919876500031	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-032	Candidate Name 32	candidate32@gmail.com	+919876500032	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-033	Candidate Name 33	candidate33@gmail.com	+919876500033	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-034	Candidate Name 34	candidate34@gmail.com	+919876500034	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-035	Candidate Name 35	candidate35@gmail.com	+919876500035	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-036	Candidate Name 36	candidate36@gmail.com	+919876500036	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-037	Candidate Name 37	candidate37@gmail.com	+919876500037	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-038	Candidate Name 38	candidate38@gmail.com	+919876500038	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-039	Candidate Name 39	candidate39@gmail.com	+919876500039	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-040	Candidate Name 40	candidate40@gmail.com	+919876500040	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-041	Candidate Name 41	candidate41@gmail.com	+919876500041	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-042	Candidate Name 42	candidate42@gmail.com	+919876500042	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-043	Candidate Name 43	candidate43@gmail.com	+919876500043	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-044	Candidate Name 44	candidate44@gmail.com	+919876500044	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-045	Candidate Name 45	candidate45@gmail.com	+919876500045	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-046	Candidate Name 46	candidate46@gmail.com	+919876500046	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-047	Candidate Name 47	candidate47@gmail.com	+919876500047	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-048	Candidate Name 48	candidate48@gmail.com	+919876500048	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-049	Candidate Name 49	candidate49@gmail.com	+919876500049	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-050	Candidate Name 50	candidate50@gmail.com	+919876500050	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-051	Candidate Name 51	candidate51@gmail.com	+919876500051	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-052	Candidate Name 52	candidate52@gmail.com	+919876500052	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-053	Candidate Name 53	candidate53@gmail.com	+919876500053	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-054	Candidate Name 54	candidate54@gmail.com	+919876500054	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-055	Candidate Name 55	candidate55@gmail.com	+919876500055	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-056	Candidate Name 56	candidate56@gmail.com	+919876500056	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-057	Candidate Name 57	candidate57@gmail.com	+919876500057	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-058	Candidate Name 58	candidate58@gmail.com	+919876500058	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-059	Candidate Name 59	candidate59@gmail.com	+919876500059	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-060	Candidate Name 60	candidate60@gmail.com	+919876500060	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-061	Candidate Name 61	candidate61@gmail.com	+919876500061	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-062	Candidate Name 62	candidate62@gmail.com	+919876500062	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-063	Candidate Name 63	candidate63@gmail.com	+919876500063	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-064	Candidate Name 64	candidate64@gmail.com	+919876500064	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-065	Candidate Name 65	candidate65@gmail.com	+919876500065	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-066	Candidate Name 66	candidate66@gmail.com	+919876500066	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-067	Candidate Name 67	candidate67@gmail.com	+919876500067	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-068	Candidate Name 68	candidate68@gmail.com	+919876500068	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-069	Candidate Name 69	candidate69@gmail.com	+919876500069	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-070	Candidate Name 70	candidate70@gmail.com	+919876500070	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-071	Candidate Name 71	candidate71@gmail.com	+919876500071	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-072	Candidate Name 72	candidate72@gmail.com	+919876500072	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-073	Candidate Name 73	candidate73@gmail.com	+919876500073	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-074	Candidate Name 74	candidate74@gmail.com	+919876500074	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-075	Candidate Name 75	candidate75@gmail.com	+919876500075	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-076	Candidate Name 76	candidate76@gmail.com	+919876500076	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-077	Candidate Name 77	candidate77@gmail.com	+919876500077	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-078	Candidate Name 78	candidate78@gmail.com	+919876500078	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-079	Candidate Name 79	candidate79@gmail.com	+919876500079	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-080	Candidate Name 80	candidate80@gmail.com	+919876500080	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-081	Candidate Name 81	candidate81@gmail.com	+919876500081	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-082	Candidate Name 82	candidate82@gmail.com	+919876500082	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-083	Candidate Name 83	candidate83@gmail.com	+919876500083	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-084	Candidate Name 84	candidate84@gmail.com	+919876500084	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-085	Candidate Name 85	candidate85@gmail.com	+919876500085	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-086	Candidate Name 86	candidate86@gmail.com	+919876500086	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-087	Candidate Name 87	candidate87@gmail.com	+919876500087	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-088	Candidate Name 88	candidate88@gmail.com	+919876500088	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-089	Candidate Name 89	candidate89@gmail.com	+919876500089	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-090	Candidate Name 90	candidate90@gmail.com	+919876500090	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-091	Candidate Name 91	candidate91@gmail.com	+919876500091	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-092	Candidate Name 92	candidate92@gmail.com	+919876500092	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-093	Candidate Name 93	candidate93@gmail.com	+919876500093	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-094	Candidate Name 94	candidate94@gmail.com	+919876500094	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-095	Candidate Name 95	candidate95@gmail.com	+919876500095	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-096	Candidate Name 96	candidate96@gmail.com	+919876500096	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-097	Candidate Name 97	candidate97@gmail.com	+919876500097	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-098	Candidate Name 98	candidate98@gmail.com	+919876500098	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-099	Candidate Name 99	candidate99@gmail.com	+919876500099	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
CAN-100	Candidate Name 100	candidate100@gmail.com	+919876500100	Software Engineer	Passionate developer.	Gandhinagar, India	Mid-level	Public
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (companyid, name, tradename, industry, website, logo, hq_location, description) FROM stdin;
COMP-001	TechCorp Global 1	TCG 1	FinTech	https://www.techcorp1.com	logo_1.png	Ahmedabad, India	Leading global tech enterprise.
COMP-002	TechCorp Global 2	TCG 2	E-Commerce	https://www.techcorp2.com	logo_2.png	Ahmedabad, India	Leading global tech enterprise.
COMP-003	TechCorp Global 3	TCG 3	AI	https://www.techcorp3.com	logo_3.png	Ahmedabad, India	Leading global tech enterprise.
COMP-004	TechCorp Global 4	TCG 4	Cloud	https://www.techcorp4.com	logo_4.png	Ahmedabad, India	Leading global tech enterprise.
COMP-005	TechCorp Global 5	TCG 5	IT	https://www.techcorp5.com	logo_5.png	Ahmedabad, India	Leading global tech enterprise.
COMP-006	TechCorp Global 6	TCG 6	FinTech	https://www.techcorp6.com	logo_6.png	Ahmedabad, India	Leading global tech enterprise.
COMP-007	TechCorp Global 7	TCG 7	E-Commerce	https://www.techcorp7.com	logo_7.png	Ahmedabad, India	Leading global tech enterprise.
COMP-008	TechCorp Global 8	TCG 8	AI	https://www.techcorp8.com	logo_8.png	Ahmedabad, India	Leading global tech enterprise.
COMP-009	TechCorp Global 9	TCG 9	Cloud	https://www.techcorp9.com	logo_9.png	Ahmedabad, India	Leading global tech enterprise.
COMP-010	TechCorp Global 10	TCG 10	IT	https://www.techcorp10.com	logo_10.png	Ahmedabad, India	Leading global tech enterprise.
COMP-011	TechCorp Global 11	TCG 11	FinTech	https://www.techcorp11.com	logo_11.png	Ahmedabad, India	Leading global tech enterprise.
COMP-012	TechCorp Global 12	TCG 12	E-Commerce	https://www.techcorp12.com	logo_12.png	Ahmedabad, India	Leading global tech enterprise.
COMP-013	TechCorp Global 13	TCG 13	AI	https://www.techcorp13.com	logo_13.png	Ahmedabad, India	Leading global tech enterprise.
COMP-014	TechCorp Global 14	TCG 14	Cloud	https://www.techcorp14.com	logo_14.png	Ahmedabad, India	Leading global tech enterprise.
COMP-015	TechCorp Global 15	TCG 15	IT	https://www.techcorp15.com	logo_15.png	Ahmedabad, India	Leading global tech enterprise.
COMP-016	TechCorp Global 16	TCG 16	FinTech	https://www.techcorp16.com	logo_16.png	Ahmedabad, India	Leading global tech enterprise.
COMP-017	TechCorp Global 17	TCG 17	E-Commerce	https://www.techcorp17.com	logo_17.png	Ahmedabad, India	Leading global tech enterprise.
COMP-018	TechCorp Global 18	TCG 18	AI	https://www.techcorp18.com	logo_18.png	Ahmedabad, India	Leading global tech enterprise.
COMP-019	TechCorp Global 19	TCG 19	Cloud	https://www.techcorp19.com	logo_19.png	Ahmedabad, India	Leading global tech enterprise.
COMP-020	TechCorp Global 20	TCG 20	IT	https://www.techcorp20.com	logo_20.png	Ahmedabad, India	Leading global tech enterprise.
COMP-021	TechCorp Global 21	TCG 21	FinTech	https://www.techcorp21.com	logo_21.png	Ahmedabad, India	Leading global tech enterprise.
COMP-022	TechCorp Global 22	TCG 22	E-Commerce	https://www.techcorp22.com	logo_22.png	Ahmedabad, India	Leading global tech enterprise.
COMP-023	TechCorp Global 23	TCG 23	AI	https://www.techcorp23.com	logo_23.png	Ahmedabad, India	Leading global tech enterprise.
COMP-024	TechCorp Global 24	TCG 24	Cloud	https://www.techcorp24.com	logo_24.png	Ahmedabad, India	Leading global tech enterprise.
COMP-025	TechCorp Global 25	TCG 25	IT	https://www.techcorp25.com	logo_25.png	Ahmedabad, India	Leading global tech enterprise.
COMP-026	TechCorp Global 26	TCG 26	FinTech	https://www.techcorp26.com	logo_26.png	Ahmedabad, India	Leading global tech enterprise.
COMP-027	TechCorp Global 27	TCG 27	E-Commerce	https://www.techcorp27.com	logo_27.png	Ahmedabad, India	Leading global tech enterprise.
COMP-028	TechCorp Global 28	TCG 28	AI	https://www.techcorp28.com	logo_28.png	Ahmedabad, India	Leading global tech enterprise.
COMP-029	TechCorp Global 29	TCG 29	Cloud	https://www.techcorp29.com	logo_29.png	Ahmedabad, India	Leading global tech enterprise.
COMP-030	TechCorp Global 30	TCG 30	IT	https://www.techcorp30.com	logo_30.png	Ahmedabad, India	Leading global tech enterprise.
COMP-031	TechCorp Global 31	TCG 31	FinTech	https://www.techcorp31.com	logo_31.png	Ahmedabad, India	Leading global tech enterprise.
COMP-032	TechCorp Global 32	TCG 32	E-Commerce	https://www.techcorp32.com	logo_32.png	Ahmedabad, India	Leading global tech enterprise.
COMP-033	TechCorp Global 33	TCG 33	AI	https://www.techcorp33.com	logo_33.png	Ahmedabad, India	Leading global tech enterprise.
COMP-034	TechCorp Global 34	TCG 34	Cloud	https://www.techcorp34.com	logo_34.png	Ahmedabad, India	Leading global tech enterprise.
COMP-035	TechCorp Global 35	TCG 35	IT	https://www.techcorp35.com	logo_35.png	Ahmedabad, India	Leading global tech enterprise.
COMP-036	TechCorp Global 36	TCG 36	FinTech	https://www.techcorp36.com	logo_36.png	Ahmedabad, India	Leading global tech enterprise.
COMP-037	TechCorp Global 37	TCG 37	E-Commerce	https://www.techcorp37.com	logo_37.png	Ahmedabad, India	Leading global tech enterprise.
COMP-038	TechCorp Global 38	TCG 38	AI	https://www.techcorp38.com	logo_38.png	Ahmedabad, India	Leading global tech enterprise.
COMP-039	TechCorp Global 39	TCG 39	Cloud	https://www.techcorp39.com	logo_39.png	Ahmedabad, India	Leading global tech enterprise.
COMP-040	TechCorp Global 40	TCG 40	IT	https://www.techcorp40.com	logo_40.png	Ahmedabad, India	Leading global tech enterprise.
COMP-041	TechCorp Global 41	TCG 41	FinTech	https://www.techcorp41.com	logo_41.png	Ahmedabad, India	Leading global tech enterprise.
COMP-042	TechCorp Global 42	TCG 42	E-Commerce	https://www.techcorp42.com	logo_42.png	Ahmedabad, India	Leading global tech enterprise.
COMP-043	TechCorp Global 43	TCG 43	AI	https://www.techcorp43.com	logo_43.png	Ahmedabad, India	Leading global tech enterprise.
COMP-044	TechCorp Global 44	TCG 44	Cloud	https://www.techcorp44.com	logo_44.png	Ahmedabad, India	Leading global tech enterprise.
COMP-045	TechCorp Global 45	TCG 45	IT	https://www.techcorp45.com	logo_45.png	Ahmedabad, India	Leading global tech enterprise.
COMP-046	TechCorp Global 46	TCG 46	FinTech	https://www.techcorp46.com	logo_46.png	Ahmedabad, India	Leading global tech enterprise.
COMP-047	TechCorp Global 47	TCG 47	E-Commerce	https://www.techcorp47.com	logo_47.png	Ahmedabad, India	Leading global tech enterprise.
COMP-048	TechCorp Global 48	TCG 48	AI	https://www.techcorp48.com	logo_48.png	Ahmedabad, India	Leading global tech enterprise.
COMP-049	TechCorp Global 49	TCG 49	Cloud	https://www.techcorp49.com	logo_49.png	Ahmedabad, India	Leading global tech enterprise.
COMP-050	TechCorp Global 50	TCG 50	IT	https://www.techcorp50.com	logo_50.png	Ahmedabad, India	Leading global tech enterprise.
COMP-051	TechCorp Global 51	TCG 51	FinTech	https://www.techcorp51.com	logo_51.png	Ahmedabad, India	Leading global tech enterprise.
COMP-052	TechCorp Global 52	TCG 52	E-Commerce	https://www.techcorp52.com	logo_52.png	Ahmedabad, India	Leading global tech enterprise.
COMP-053	TechCorp Global 53	TCG 53	AI	https://www.techcorp53.com	logo_53.png	Ahmedabad, India	Leading global tech enterprise.
COMP-054	TechCorp Global 54	TCG 54	Cloud	https://www.techcorp54.com	logo_54.png	Ahmedabad, India	Leading global tech enterprise.
COMP-055	TechCorp Global 55	TCG 55	IT	https://www.techcorp55.com	logo_55.png	Ahmedabad, India	Leading global tech enterprise.
COMP-056	TechCorp Global 56	TCG 56	FinTech	https://www.techcorp56.com	logo_56.png	Ahmedabad, India	Leading global tech enterprise.
COMP-057	TechCorp Global 57	TCG 57	E-Commerce	https://www.techcorp57.com	logo_57.png	Ahmedabad, India	Leading global tech enterprise.
COMP-058	TechCorp Global 58	TCG 58	AI	https://www.techcorp58.com	logo_58.png	Ahmedabad, India	Leading global tech enterprise.
COMP-059	TechCorp Global 59	TCG 59	Cloud	https://www.techcorp59.com	logo_59.png	Ahmedabad, India	Leading global tech enterprise.
COMP-060	TechCorp Global 60	TCG 60	IT	https://www.techcorp60.com	logo_60.png	Ahmedabad, India	Leading global tech enterprise.
COMP-061	TechCorp Global 61	TCG 61	FinTech	https://www.techcorp61.com	logo_61.png	Ahmedabad, India	Leading global tech enterprise.
COMP-062	TechCorp Global 62	TCG 62	E-Commerce	https://www.techcorp62.com	logo_62.png	Ahmedabad, India	Leading global tech enterprise.
COMP-063	TechCorp Global 63	TCG 63	AI	https://www.techcorp63.com	logo_63.png	Ahmedabad, India	Leading global tech enterprise.
COMP-064	TechCorp Global 64	TCG 64	Cloud	https://www.techcorp64.com	logo_64.png	Ahmedabad, India	Leading global tech enterprise.
COMP-065	TechCorp Global 65	TCG 65	IT	https://www.techcorp65.com	logo_65.png	Ahmedabad, India	Leading global tech enterprise.
COMP-066	TechCorp Global 66	TCG 66	FinTech	https://www.techcorp66.com	logo_66.png	Ahmedabad, India	Leading global tech enterprise.
COMP-067	TechCorp Global 67	TCG 67	E-Commerce	https://www.techcorp67.com	logo_67.png	Ahmedabad, India	Leading global tech enterprise.
COMP-068	TechCorp Global 68	TCG 68	AI	https://www.techcorp68.com	logo_68.png	Ahmedabad, India	Leading global tech enterprise.
COMP-069	TechCorp Global 69	TCG 69	Cloud	https://www.techcorp69.com	logo_69.png	Ahmedabad, India	Leading global tech enterprise.
COMP-070	TechCorp Global 70	TCG 70	IT	https://www.techcorp70.com	logo_70.png	Ahmedabad, India	Leading global tech enterprise.
COMP-071	TechCorp Global 71	TCG 71	FinTech	https://www.techcorp71.com	logo_71.png	Ahmedabad, India	Leading global tech enterprise.
COMP-072	TechCorp Global 72	TCG 72	E-Commerce	https://www.techcorp72.com	logo_72.png	Ahmedabad, India	Leading global tech enterprise.
COMP-073	TechCorp Global 73	TCG 73	AI	https://www.techcorp73.com	logo_73.png	Ahmedabad, India	Leading global tech enterprise.
COMP-074	TechCorp Global 74	TCG 74	Cloud	https://www.techcorp74.com	logo_74.png	Ahmedabad, India	Leading global tech enterprise.
COMP-075	TechCorp Global 75	TCG 75	IT	https://www.techcorp75.com	logo_75.png	Ahmedabad, India	Leading global tech enterprise.
COMP-076	TechCorp Global 76	TCG 76	FinTech	https://www.techcorp76.com	logo_76.png	Ahmedabad, India	Leading global tech enterprise.
COMP-077	TechCorp Global 77	TCG 77	E-Commerce	https://www.techcorp77.com	logo_77.png	Ahmedabad, India	Leading global tech enterprise.
COMP-078	TechCorp Global 78	TCG 78	AI	https://www.techcorp78.com	logo_78.png	Ahmedabad, India	Leading global tech enterprise.
COMP-079	TechCorp Global 79	TCG 79	Cloud	https://www.techcorp79.com	logo_79.png	Ahmedabad, India	Leading global tech enterprise.
COMP-080	TechCorp Global 80	TCG 80	IT	https://www.techcorp80.com	logo_80.png	Ahmedabad, India	Leading global tech enterprise.
COMP-081	TechCorp Global 81	TCG 81	FinTech	https://www.techcorp81.com	logo_81.png	Ahmedabad, India	Leading global tech enterprise.
COMP-082	TechCorp Global 82	TCG 82	E-Commerce	https://www.techcorp82.com	logo_82.png	Ahmedabad, India	Leading global tech enterprise.
COMP-083	TechCorp Global 83	TCG 83	AI	https://www.techcorp83.com	logo_83.png	Ahmedabad, India	Leading global tech enterprise.
COMP-084	TechCorp Global 84	TCG 84	Cloud	https://www.techcorp84.com	logo_84.png	Ahmedabad, India	Leading global tech enterprise.
COMP-085	TechCorp Global 85	TCG 85	IT	https://www.techcorp85.com	logo_85.png	Ahmedabad, India	Leading global tech enterprise.
COMP-086	TechCorp Global 86	TCG 86	FinTech	https://www.techcorp86.com	logo_86.png	Ahmedabad, India	Leading global tech enterprise.
COMP-087	TechCorp Global 87	TCG 87	E-Commerce	https://www.techcorp87.com	logo_87.png	Ahmedabad, India	Leading global tech enterprise.
COMP-088	TechCorp Global 88	TCG 88	AI	https://www.techcorp88.com	logo_88.png	Ahmedabad, India	Leading global tech enterprise.
COMP-089	TechCorp Global 89	TCG 89	Cloud	https://www.techcorp89.com	logo_89.png	Ahmedabad, India	Leading global tech enterprise.
COMP-090	TechCorp Global 90	TCG 90	IT	https://www.techcorp90.com	logo_90.png	Ahmedabad, India	Leading global tech enterprise.
COMP-091	TechCorp Global 91	TCG 91	FinTech	https://www.techcorp91.com	logo_91.png	Ahmedabad, India	Leading global tech enterprise.
COMP-092	TechCorp Global 92	TCG 92	E-Commerce	https://www.techcorp92.com	logo_92.png	Ahmedabad, India	Leading global tech enterprise.
COMP-093	TechCorp Global 93	TCG 93	AI	https://www.techcorp93.com	logo_93.png	Ahmedabad, India	Leading global tech enterprise.
COMP-094	TechCorp Global 94	TCG 94	Cloud	https://www.techcorp94.com	logo_94.png	Ahmedabad, India	Leading global tech enterprise.
COMP-095	TechCorp Global 95	TCG 95	IT	https://www.techcorp95.com	logo_95.png	Ahmedabad, India	Leading global tech enterprise.
COMP-096	TechCorp Global 96	TCG 96	FinTech	https://www.techcorp96.com	logo_96.png	Ahmedabad, India	Leading global tech enterprise.
COMP-097	TechCorp Global 97	TCG 97	E-Commerce	https://www.techcorp97.com	logo_97.png	Ahmedabad, India	Leading global tech enterprise.
COMP-098	TechCorp Global 98	TCG 98	AI	https://www.techcorp98.com	logo_98.png	Ahmedabad, India	Leading global tech enterprise.
COMP-099	TechCorp Global 99	TCG 99	Cloud	https://www.techcorp99.com	logo_99.png	Ahmedabad, India	Leading global tech enterprise.
COMP-100	TechCorp Global 100	TCG 100	IT	https://www.techcorp100.com	logo_100.png	Ahmedabad, India	Leading global tech enterprise.
\.


--
-- Data for Name: subscription_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_plan (planid, tiername, postinglimit, credits, price) FROM stdin;
PLN-01	Basic Free	5	5	0.00
PLN-02	Starter Pro	25	30	2499.00
PLN-03	Business Growth	60	75	5999.00
PLN-04	Enterprise Scale	150	200	14999.00
PLN-05	Unlimited Corporate	500	600	39999.00
PLN-006	Tier Custom 6	16	21	1005.00
PLN-007	Tier Custom 7	17	22	1006.00
PLN-008	Tier Custom 8	18	23	1007.00
PLN-009	Tier Custom 9	19	24	1008.00
PLN-010	Tier Custom 10	20	25	1009.00
PLN-011	Tier Custom 11	21	26	1010.00
PLN-012	Tier Custom 12	22	27	1011.00
PLN-013	Tier Custom 13	23	28	1012.00
PLN-014	Tier Custom 14	24	29	1013.00
PLN-015	Tier Custom 15	25	30	1014.00
PLN-016	Tier Custom 16	26	31	1015.00
PLN-017	Tier Custom 17	27	32	1016.00
PLN-018	Tier Custom 18	28	33	1017.00
PLN-019	Tier Custom 19	29	34	1018.00
PLN-020	Tier Custom 20	30	35	1019.00
PLN-021	Tier Custom 21	31	36	1020.00
PLN-022	Tier Custom 22	32	37	1021.00
PLN-023	Tier Custom 23	33	38	1022.00
PLN-024	Tier Custom 24	34	39	1023.00
PLN-025	Tier Custom 25	35	40	1024.00
PLN-026	Tier Custom 26	36	41	1025.00
PLN-027	Tier Custom 27	37	42	1026.00
PLN-028	Tier Custom 28	38	43	1027.00
PLN-029	Tier Custom 29	39	44	1028.00
PLN-030	Tier Custom 30	40	45	1029.00
PLN-031	Tier Custom 31	41	46	1030.00
PLN-032	Tier Custom 32	42	47	1031.00
PLN-033	Tier Custom 33	43	48	1032.00
PLN-034	Tier Custom 34	44	49	1033.00
PLN-035	Tier Custom 35	45	50	1034.00
PLN-036	Tier Custom 36	46	51	1035.00
PLN-037	Tier Custom 37	47	52	1036.00
PLN-038	Tier Custom 38	48	53	1037.00
PLN-039	Tier Custom 39	49	54	1038.00
PLN-040	Tier Custom 40	50	55	1039.00
PLN-041	Tier Custom 41	51	56	1040.00
PLN-042	Tier Custom 42	52	57	1041.00
PLN-043	Tier Custom 43	53	58	1042.00
PLN-044	Tier Custom 44	54	59	1043.00
PLN-045	Tier Custom 45	55	60	1044.00
PLN-046	Tier Custom 46	56	61	1045.00
PLN-047	Tier Custom 47	57	62	1046.00
PLN-048	Tier Custom 48	58	63	1047.00
PLN-049	Tier Custom 49	59	64	1048.00
PLN-050	Tier Custom 50	60	65	1049.00
PLN-051	Tier Custom 51	61	66	1050.00
PLN-052	Tier Custom 52	62	67	1051.00
PLN-053	Tier Custom 53	63	68	1052.00
PLN-054	Tier Custom 54	64	69	1053.00
PLN-055	Tier Custom 55	65	70	1054.00
PLN-056	Tier Custom 56	66	71	1055.00
PLN-057	Tier Custom 57	67	72	1056.00
PLN-058	Tier Custom 58	68	73	1057.00
PLN-059	Tier Custom 59	69	74	1058.00
PLN-060	Tier Custom 60	70	75	1059.00
PLN-061	Tier Custom 61	71	76	1060.00
PLN-062	Tier Custom 62	72	77	1061.00
PLN-063	Tier Custom 63	73	78	1062.00
PLN-064	Tier Custom 64	74	79	1063.00
PLN-065	Tier Custom 65	75	80	1064.00
PLN-066	Tier Custom 66	76	81	1065.00
PLN-067	Tier Custom 67	77	82	1066.00
PLN-068	Tier Custom 68	78	83	1067.00
PLN-069	Tier Custom 69	79	84	1068.00
PLN-070	Tier Custom 70	80	85	1069.00
PLN-071	Tier Custom 71	81	86	1070.00
PLN-072	Tier Custom 72	82	87	1071.00
PLN-073	Tier Custom 73	83	88	1072.00
PLN-074	Tier Custom 74	84	89	1073.00
PLN-075	Tier Custom 75	85	90	1074.00
PLN-076	Tier Custom 76	86	91	1075.00
PLN-077	Tier Custom 77	87	92	1076.00
PLN-078	Tier Custom 78	88	93	1077.00
PLN-079	Tier Custom 79	89	94	1078.00
PLN-080	Tier Custom 80	90	95	1079.00
PLN-081	Tier Custom 81	91	96	1080.00
PLN-082	Tier Custom 82	92	97	1081.00
PLN-083	Tier Custom 83	93	98	1082.00
PLN-084	Tier Custom 84	94	99	1083.00
PLN-085	Tier Custom 85	95	100	1084.00
PLN-086	Tier Custom 86	96	101	1085.00
PLN-087	Tier Custom 87	97	102	1086.00
PLN-088	Tier Custom 88	98	103	1087.00
PLN-089	Tier Custom 89	99	104	1088.00
PLN-090	Tier Custom 90	100	105	1089.00
PLN-091	Tier Custom 91	101	106	1090.00
PLN-092	Tier Custom 92	102	107	1091.00
PLN-093	Tier Custom 93	103	108	1092.00
PLN-094	Tier Custom 94	104	109	1093.00
PLN-095	Tier Custom 95	105	110	1094.00
PLN-096	Tier Custom 96	106	111	1095.00
PLN-097	Tier Custom 97	107	112	1096.00
PLN-098	Tier Custom 98	108	113	1097.00
PLN-099	Tier Custom 99	109	114	1098.00
PLN-100	Tier Custom 100	110	115	1099.00
\.


--
-- Data for Name: employer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employer (employerid, companyid, planid, email, phone, verificationstatus, creditsremaining) FROM stdin;
EMP-001	COMP-001	PLN-01	employer1@company.com	+919123400001	Verified	50
EMP-002	COMP-002	PLN-01	employer2@company.com	+919123400002	Verified	50
EMP-003	COMP-003	PLN-01	employer3@company.com	+919123400003	Verified	50
EMP-004	COMP-004	PLN-01	employer4@company.com	+919123400004	Verified	50
EMP-005	COMP-005	PLN-01	employer5@company.com	+919123400005	Verified	50
EMP-006	COMP-006	PLN-01	employer6@company.com	+919123400006	Verified	50
EMP-007	COMP-007	PLN-01	employer7@company.com	+919123400007	Verified	50
EMP-008	COMP-008	PLN-01	employer8@company.com	+919123400008	Verified	50
EMP-009	COMP-009	PLN-01	employer9@company.com	+919123400009	Verified	50
EMP-010	COMP-010	PLN-01	employer10@company.com	+919123400010	Verified	50
EMP-011	COMP-011	PLN-01	employer11@company.com	+919123400011	Verified	50
EMP-012	COMP-012	PLN-01	employer12@company.com	+919123400012	Verified	50
EMP-013	COMP-013	PLN-01	employer13@company.com	+919123400013	Verified	50
EMP-014	COMP-014	PLN-01	employer14@company.com	+919123400014	Verified	50
EMP-015	COMP-015	PLN-01	employer15@company.com	+919123400015	Verified	50
EMP-016	COMP-016	PLN-01	employer16@company.com	+919123400016	Verified	50
EMP-017	COMP-017	PLN-01	employer17@company.com	+919123400017	Verified	50
EMP-018	COMP-018	PLN-01	employer18@company.com	+919123400018	Verified	50
EMP-019	COMP-019	PLN-01	employer19@company.com	+919123400019	Verified	50
EMP-020	COMP-020	PLN-01	employer20@company.com	+919123400020	Verified	50
EMP-021	COMP-021	PLN-01	employer21@company.com	+919123400021	Verified	50
EMP-022	COMP-022	PLN-01	employer22@company.com	+919123400022	Verified	50
EMP-023	COMP-023	PLN-01	employer23@company.com	+919123400023	Verified	50
EMP-024	COMP-024	PLN-01	employer24@company.com	+919123400024	Verified	50
EMP-025	COMP-025	PLN-01	employer25@company.com	+919123400025	Verified	50
EMP-026	COMP-026	PLN-01	employer26@company.com	+919123400026	Verified	50
EMP-027	COMP-027	PLN-01	employer27@company.com	+919123400027	Verified	50
EMP-028	COMP-028	PLN-01	employer28@company.com	+919123400028	Verified	50
EMP-029	COMP-029	PLN-01	employer29@company.com	+919123400029	Verified	50
EMP-030	COMP-030	PLN-01	employer30@company.com	+919123400030	Verified	50
EMP-031	COMP-031	PLN-01	employer31@company.com	+919123400031	Verified	50
EMP-032	COMP-032	PLN-01	employer32@company.com	+919123400032	Verified	50
EMP-033	COMP-033	PLN-01	employer33@company.com	+919123400033	Verified	50
EMP-034	COMP-034	PLN-01	employer34@company.com	+919123400034	Verified	50
EMP-035	COMP-035	PLN-01	employer35@company.com	+919123400035	Verified	50
EMP-036	COMP-036	PLN-01	employer36@company.com	+919123400036	Verified	50
EMP-037	COMP-037	PLN-01	employer37@company.com	+919123400037	Verified	50
EMP-038	COMP-038	PLN-01	employer38@company.com	+919123400038	Verified	50
EMP-039	COMP-039	PLN-01	employer39@company.com	+919123400039	Verified	50
EMP-040	COMP-040	PLN-01	employer40@company.com	+919123400040	Verified	50
EMP-041	COMP-041	PLN-01	employer41@company.com	+919123400041	Verified	50
EMP-042	COMP-042	PLN-01	employer42@company.com	+919123400042	Verified	50
EMP-043	COMP-043	PLN-01	employer43@company.com	+919123400043	Verified	50
EMP-044	COMP-044	PLN-01	employer44@company.com	+919123400044	Verified	50
EMP-045	COMP-045	PLN-01	employer45@company.com	+919123400045	Verified	50
EMP-046	COMP-046	PLN-01	employer46@company.com	+919123400046	Verified	50
EMP-047	COMP-047	PLN-01	employer47@company.com	+919123400047	Verified	50
EMP-048	COMP-048	PLN-01	employer48@company.com	+919123400048	Verified	50
EMP-049	COMP-049	PLN-01	employer49@company.com	+919123400049	Verified	50
EMP-050	COMP-050	PLN-01	employer50@company.com	+919123400050	Verified	50
EMP-051	COMP-051	PLN-01	employer51@company.com	+919123400051	Verified	50
EMP-052	COMP-052	PLN-01	employer52@company.com	+919123400052	Verified	50
EMP-053	COMP-053	PLN-01	employer53@company.com	+919123400053	Verified	50
EMP-054	COMP-054	PLN-01	employer54@company.com	+919123400054	Verified	50
EMP-055	COMP-055	PLN-01	employer55@company.com	+919123400055	Verified	50
EMP-056	COMP-056	PLN-01	employer56@company.com	+919123400056	Verified	50
EMP-057	COMP-057	PLN-01	employer57@company.com	+919123400057	Verified	50
EMP-058	COMP-058	PLN-01	employer58@company.com	+919123400058	Verified	50
EMP-059	COMP-059	PLN-01	employer59@company.com	+919123400059	Verified	50
EMP-060	COMP-060	PLN-01	employer60@company.com	+919123400060	Verified	50
EMP-061	COMP-061	PLN-01	employer61@company.com	+919123400061	Verified	50
EMP-062	COMP-062	PLN-01	employer62@company.com	+919123400062	Verified	50
EMP-063	COMP-063	PLN-01	employer63@company.com	+919123400063	Verified	50
EMP-064	COMP-064	PLN-01	employer64@company.com	+919123400064	Verified	50
EMP-065	COMP-065	PLN-01	employer65@company.com	+919123400065	Verified	50
EMP-066	COMP-066	PLN-01	employer66@company.com	+919123400066	Verified	50
EMP-067	COMP-067	PLN-01	employer67@company.com	+919123400067	Verified	50
EMP-068	COMP-068	PLN-01	employer68@company.com	+919123400068	Verified	50
EMP-069	COMP-069	PLN-01	employer69@company.com	+919123400069	Verified	50
EMP-070	COMP-070	PLN-01	employer70@company.com	+919123400070	Verified	50
EMP-071	COMP-071	PLN-01	employer71@company.com	+919123400071	Verified	50
EMP-072	COMP-072	PLN-01	employer72@company.com	+919123400072	Verified	50
EMP-073	COMP-073	PLN-01	employer73@company.com	+919123400073	Verified	50
EMP-074	COMP-074	PLN-01	employer74@company.com	+919123400074	Verified	50
EMP-075	COMP-075	PLN-01	employer75@company.com	+919123400075	Verified	50
EMP-076	COMP-076	PLN-01	employer76@company.com	+919123400076	Verified	50
EMP-077	COMP-077	PLN-01	employer77@company.com	+919123400077	Verified	50
EMP-078	COMP-078	PLN-01	employer78@company.com	+919123400078	Verified	50
EMP-079	COMP-079	PLN-01	employer79@company.com	+919123400079	Verified	50
EMP-080	COMP-080	PLN-01	employer80@company.com	+919123400080	Verified	50
EMP-081	COMP-081	PLN-01	employer81@company.com	+919123400081	Verified	50
EMP-082	COMP-082	PLN-01	employer82@company.com	+919123400082	Verified	50
EMP-083	COMP-083	PLN-01	employer83@company.com	+919123400083	Verified	50
EMP-084	COMP-084	PLN-01	employer84@company.com	+919123400084	Verified	50
EMP-085	COMP-085	PLN-01	employer85@company.com	+919123400085	Verified	50
EMP-086	COMP-086	PLN-01	employer86@company.com	+919123400086	Verified	50
EMP-087	COMP-087	PLN-01	employer87@company.com	+919123400087	Verified	50
EMP-088	COMP-088	PLN-01	employer88@company.com	+919123400088	Verified	50
EMP-089	COMP-089	PLN-01	employer89@company.com	+919123400089	Verified	50
EMP-090	COMP-090	PLN-01	employer90@company.com	+919123400090	Verified	50
EMP-091	COMP-091	PLN-01	employer91@company.com	+919123400091	Verified	50
EMP-092	COMP-092	PLN-01	employer92@company.com	+919123400092	Verified	50
EMP-093	COMP-093	PLN-01	employer93@company.com	+919123400093	Verified	50
EMP-094	COMP-094	PLN-01	employer94@company.com	+919123400094	Verified	50
EMP-095	COMP-095	PLN-01	employer95@company.com	+919123400095	Verified	50
EMP-096	COMP-096	PLN-01	employer96@company.com	+919123400096	Verified	50
EMP-097	COMP-097	PLN-01	employer97@company.com	+919123400097	Verified	50
EMP-098	COMP-098	PLN-01	employer98@company.com	+919123400098	Verified	50
EMP-099	COMP-099	PLN-01	employer99@company.com	+919123400099	Verified	50
EMP-100	COMP-100	PLN-01	employer100@company.com	+919123400100	Verified	50
\.


--
-- Data for Name: job_posting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_posting (jobid, employerid, title, description, location, employmenttype, senioritylevel, salarymin, salarymax, postdate, expirydate, status) FROM stdin;
JOB-001	EMP-001	Software Engineer 1	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-002	EMP-002	Software Engineer 2	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-003	EMP-003	Software Engineer 3	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-004	EMP-004	Software Engineer 4	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-005	EMP-005	Software Engineer 5	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-006	EMP-006	Software Engineer 6	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-007	EMP-007	Software Engineer 7	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-008	EMP-008	Software Engineer 8	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-009	EMP-009	Software Engineer 9	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-010	EMP-010	Software Engineer 10	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-011	EMP-011	Software Engineer 11	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-012	EMP-012	Software Engineer 12	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-013	EMP-013	Software Engineer 13	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-014	EMP-014	Software Engineer 14	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-015	EMP-015	Software Engineer 15	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-016	EMP-016	Software Engineer 16	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-017	EMP-017	Software Engineer 17	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-018	EMP-018	Software Engineer 18	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-019	EMP-019	Software Engineer 19	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-020	EMP-020	Software Engineer 20	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-021	EMP-021	Software Engineer 21	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-022	EMP-022	Software Engineer 22	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-023	EMP-023	Software Engineer 23	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-024	EMP-024	Software Engineer 24	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-025	EMP-025	Software Engineer 25	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-026	EMP-026	Software Engineer 26	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-027	EMP-027	Software Engineer 27	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-028	EMP-028	Software Engineer 28	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-029	EMP-029	Software Engineer 29	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-030	EMP-030	Software Engineer 30	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-031	EMP-031	Software Engineer 31	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-032	EMP-032	Software Engineer 32	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-033	EMP-033	Software Engineer 33	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-034	EMP-034	Software Engineer 34	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-035	EMP-035	Software Engineer 35	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-036	EMP-036	Software Engineer 36	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-037	EMP-037	Software Engineer 37	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-038	EMP-038	Software Engineer 38	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-039	EMP-039	Software Engineer 39	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-040	EMP-040	Software Engineer 40	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-041	EMP-041	Software Engineer 41	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-042	EMP-042	Software Engineer 42	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-043	EMP-043	Software Engineer 43	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-044	EMP-044	Software Engineer 44	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-045	EMP-045	Software Engineer 45	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-046	EMP-046	Software Engineer 46	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-047	EMP-047	Software Engineer 47	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-048	EMP-048	Software Engineer 48	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-049	EMP-049	Software Engineer 49	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-050	EMP-050	Software Engineer 50	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-051	EMP-051	Software Engineer 51	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-052	EMP-052	Software Engineer 52	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-053	EMP-053	Software Engineer 53	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-054	EMP-054	Software Engineer 54	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-055	EMP-055	Software Engineer 55	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-056	EMP-056	Software Engineer 56	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-057	EMP-057	Software Engineer 57	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-058	EMP-058	Software Engineer 58	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-059	EMP-059	Software Engineer 59	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-060	EMP-060	Software Engineer 60	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-061	EMP-061	Software Engineer 61	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-062	EMP-062	Software Engineer 62	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-063	EMP-063	Software Engineer 63	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-064	EMP-064	Software Engineer 64	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-065	EMP-065	Software Engineer 65	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-066	EMP-066	Software Engineer 66	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-067	EMP-067	Software Engineer 67	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-068	EMP-068	Software Engineer 68	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-069	EMP-069	Software Engineer 69	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-070	EMP-070	Software Engineer 70	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-071	EMP-071	Software Engineer 71	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-072	EMP-072	Software Engineer 72	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-073	EMP-073	Software Engineer 73	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-074	EMP-074	Software Engineer 74	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-075	EMP-075	Software Engineer 75	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-076	EMP-076	Software Engineer 76	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-077	EMP-077	Software Engineer 77	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-078	EMP-078	Software Engineer 78	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-079	EMP-079	Software Engineer 79	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-080	EMP-080	Software Engineer 80	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-081	EMP-081	Software Engineer 81	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-082	EMP-082	Software Engineer 82	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-083	EMP-083	Software Engineer 83	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-084	EMP-084	Software Engineer 84	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-085	EMP-085	Software Engineer 85	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-086	EMP-086	Software Engineer 86	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-087	EMP-087	Software Engineer 87	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-088	EMP-088	Software Engineer 88	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-089	EMP-089	Software Engineer 89	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-090	EMP-090	Software Engineer 90	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-091	EMP-091	Software Engineer 91	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-092	EMP-092	Software Engineer 92	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-093	EMP-093	Software Engineer 93	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-094	EMP-094	Software Engineer 94	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-095	EMP-095	Software Engineer 95	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-096	EMP-096	Software Engineer 96	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-097	EMP-097	Software Engineer 97	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-098	EMP-098	Software Engineer 98	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-099	EMP-099	Software Engineer 99	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
JOB-100	EMP-100	Software Engineer 100	Backend development role.	Bangalore, India	Full-time	Mid-level	500000.00	1000000.00	2026-10-27 09:15:59.971905	2026-11-26 09:15:59.971905	Active
\.


--
-- Data for Name: resume; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resume (candidateid, resumeid, versionname, filepath, isdefault) FROM stdin;
CAN-001	RES-01	Default Resume	/resumes/cand_1.pdf	t
CAN-002	RES-01	Default Resume	/resumes/cand_2.pdf	t
CAN-003	RES-01	Default Resume	/resumes/cand_3.pdf	t
CAN-004	RES-01	Default Resume	/resumes/cand_4.pdf	t
CAN-005	RES-01	Default Resume	/resumes/cand_5.pdf	t
CAN-006	RES-01	Default Resume	/resumes/cand_6.pdf	t
CAN-007	RES-01	Default Resume	/resumes/cand_7.pdf	t
CAN-008	RES-01	Default Resume	/resumes/cand_8.pdf	t
CAN-009	RES-01	Default Resume	/resumes/cand_9.pdf	t
CAN-010	RES-01	Default Resume	/resumes/cand_10.pdf	t
CAN-011	RES-01	Default Resume	/resumes/cand_11.pdf	t
CAN-012	RES-01	Default Resume	/resumes/cand_12.pdf	t
CAN-013	RES-01	Default Resume	/resumes/cand_13.pdf	t
CAN-014	RES-01	Default Resume	/resumes/cand_14.pdf	t
CAN-015	RES-01	Default Resume	/resumes/cand_15.pdf	t
CAN-016	RES-01	Default Resume	/resumes/cand_16.pdf	t
CAN-017	RES-01	Default Resume	/resumes/cand_17.pdf	t
CAN-018	RES-01	Default Resume	/resumes/cand_18.pdf	t
CAN-019	RES-01	Default Resume	/resumes/cand_19.pdf	t
CAN-020	RES-01	Default Resume	/resumes/cand_20.pdf	t
CAN-021	RES-01	Default Resume	/resumes/cand_21.pdf	t
CAN-022	RES-01	Default Resume	/resumes/cand_22.pdf	t
CAN-023	RES-01	Default Resume	/resumes/cand_23.pdf	t
CAN-024	RES-01	Default Resume	/resumes/cand_24.pdf	t
CAN-025	RES-01	Default Resume	/resumes/cand_25.pdf	t
CAN-026	RES-01	Default Resume	/resumes/cand_26.pdf	t
CAN-027	RES-01	Default Resume	/resumes/cand_27.pdf	t
CAN-028	RES-01	Default Resume	/resumes/cand_28.pdf	t
CAN-029	RES-01	Default Resume	/resumes/cand_29.pdf	t
CAN-030	RES-01	Default Resume	/resumes/cand_30.pdf	t
CAN-031	RES-01	Default Resume	/resumes/cand_31.pdf	t
CAN-032	RES-01	Default Resume	/resumes/cand_32.pdf	t
CAN-033	RES-01	Default Resume	/resumes/cand_33.pdf	t
CAN-034	RES-01	Default Resume	/resumes/cand_34.pdf	t
CAN-035	RES-01	Default Resume	/resumes/cand_35.pdf	t
CAN-036	RES-01	Default Resume	/resumes/cand_36.pdf	t
CAN-037	RES-01	Default Resume	/resumes/cand_37.pdf	t
CAN-038	RES-01	Default Resume	/resumes/cand_38.pdf	t
CAN-039	RES-01	Default Resume	/resumes/cand_39.pdf	t
CAN-040	RES-01	Default Resume	/resumes/cand_40.pdf	t
CAN-041	RES-01	Default Resume	/resumes/cand_41.pdf	t
CAN-042	RES-01	Default Resume	/resumes/cand_42.pdf	t
CAN-043	RES-01	Default Resume	/resumes/cand_43.pdf	t
CAN-044	RES-01	Default Resume	/resumes/cand_44.pdf	t
CAN-045	RES-01	Default Resume	/resumes/cand_45.pdf	t
CAN-046	RES-01	Default Resume	/resumes/cand_46.pdf	t
CAN-047	RES-01	Default Resume	/resumes/cand_47.pdf	t
CAN-048	RES-01	Default Resume	/resumes/cand_48.pdf	t
CAN-049	RES-01	Default Resume	/resumes/cand_49.pdf	t
CAN-050	RES-01	Default Resume	/resumes/cand_50.pdf	t
CAN-051	RES-01	Default Resume	/resumes/cand_51.pdf	t
CAN-052	RES-01	Default Resume	/resumes/cand_52.pdf	t
CAN-053	RES-01	Default Resume	/resumes/cand_53.pdf	t
CAN-054	RES-01	Default Resume	/resumes/cand_54.pdf	t
CAN-055	RES-01	Default Resume	/resumes/cand_55.pdf	t
CAN-056	RES-01	Default Resume	/resumes/cand_56.pdf	t
CAN-057	RES-01	Default Resume	/resumes/cand_57.pdf	t
CAN-058	RES-01	Default Resume	/resumes/cand_58.pdf	t
CAN-059	RES-01	Default Resume	/resumes/cand_59.pdf	t
CAN-060	RES-01	Default Resume	/resumes/cand_60.pdf	t
CAN-061	RES-01	Default Resume	/resumes/cand_61.pdf	t
CAN-062	RES-01	Default Resume	/resumes/cand_62.pdf	t
CAN-063	RES-01	Default Resume	/resumes/cand_63.pdf	t
CAN-064	RES-01	Default Resume	/resumes/cand_64.pdf	t
CAN-065	RES-01	Default Resume	/resumes/cand_65.pdf	t
CAN-066	RES-01	Default Resume	/resumes/cand_66.pdf	t
CAN-067	RES-01	Default Resume	/resumes/cand_67.pdf	t
CAN-068	RES-01	Default Resume	/resumes/cand_68.pdf	t
CAN-069	RES-01	Default Resume	/resumes/cand_69.pdf	t
CAN-070	RES-01	Default Resume	/resumes/cand_70.pdf	t
CAN-071	RES-01	Default Resume	/resumes/cand_71.pdf	t
CAN-072	RES-01	Default Resume	/resumes/cand_72.pdf	t
CAN-073	RES-01	Default Resume	/resumes/cand_73.pdf	t
CAN-074	RES-01	Default Resume	/resumes/cand_74.pdf	t
CAN-075	RES-01	Default Resume	/resumes/cand_75.pdf	t
CAN-076	RES-01	Default Resume	/resumes/cand_76.pdf	t
CAN-077	RES-01	Default Resume	/resumes/cand_77.pdf	t
CAN-078	RES-01	Default Resume	/resumes/cand_78.pdf	t
CAN-079	RES-01	Default Resume	/resumes/cand_79.pdf	t
CAN-080	RES-01	Default Resume	/resumes/cand_80.pdf	t
CAN-081	RES-01	Default Resume	/resumes/cand_81.pdf	t
CAN-082	RES-01	Default Resume	/resumes/cand_82.pdf	t
CAN-083	RES-01	Default Resume	/resumes/cand_83.pdf	t
CAN-084	RES-01	Default Resume	/resumes/cand_84.pdf	t
CAN-085	RES-01	Default Resume	/resumes/cand_85.pdf	t
CAN-086	RES-01	Default Resume	/resumes/cand_86.pdf	t
CAN-087	RES-01	Default Resume	/resumes/cand_87.pdf	t
CAN-088	RES-01	Default Resume	/resumes/cand_88.pdf	t
CAN-089	RES-01	Default Resume	/resumes/cand_89.pdf	t
CAN-090	RES-01	Default Resume	/resumes/cand_90.pdf	t
CAN-091	RES-01	Default Resume	/resumes/cand_91.pdf	t
CAN-092	RES-01	Default Resume	/resumes/cand_92.pdf	t
CAN-093	RES-01	Default Resume	/resumes/cand_93.pdf	t
CAN-094	RES-01	Default Resume	/resumes/cand_94.pdf	t
CAN-095	RES-01	Default Resume	/resumes/cand_95.pdf	t
CAN-096	RES-01	Default Resume	/resumes/cand_96.pdf	t
CAN-097	RES-01	Default Resume	/resumes/cand_97.pdf	t
CAN-098	RES-01	Default Resume	/resumes/cand_98.pdf	t
CAN-099	RES-01	Default Resume	/resumes/cand_99.pdf	t
CAN-100	RES-01	Default Resume	/resumes/cand_100.pdf	t
\.


--
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application (applicationid, candidateid, jobid, resumeid, "timestamp", stage, isdraft) FROM stdin;
APP-001	CAN-001	JOB-001	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-002	CAN-002	JOB-002	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-003	CAN-003	JOB-003	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-004	CAN-004	JOB-004	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-005	CAN-005	JOB-005	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-006	CAN-006	JOB-006	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-007	CAN-007	JOB-007	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-008	CAN-008	JOB-008	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-009	CAN-009	JOB-009	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-010	CAN-010	JOB-010	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-011	CAN-011	JOB-011	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-012	CAN-012	JOB-012	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-013	CAN-013	JOB-013	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-014	CAN-014	JOB-014	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-015	CAN-015	JOB-015	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-016	CAN-016	JOB-016	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-017	CAN-017	JOB-017	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-018	CAN-018	JOB-018	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-019	CAN-019	JOB-019	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-020	CAN-020	JOB-020	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-021	CAN-021	JOB-021	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-022	CAN-022	JOB-022	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-023	CAN-023	JOB-023	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-024	CAN-024	JOB-024	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-025	CAN-025	JOB-025	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-026	CAN-026	JOB-026	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-027	CAN-027	JOB-027	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-028	CAN-028	JOB-028	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-029	CAN-029	JOB-029	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-030	CAN-030	JOB-030	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-031	CAN-031	JOB-031	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-032	CAN-032	JOB-032	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-033	CAN-033	JOB-033	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-034	CAN-034	JOB-034	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-035	CAN-035	JOB-035	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-036	CAN-036	JOB-036	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-037	CAN-037	JOB-037	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-038	CAN-038	JOB-038	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-039	CAN-039	JOB-039	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-040	CAN-040	JOB-040	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-041	CAN-041	JOB-041	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-042	CAN-042	JOB-042	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-043	CAN-043	JOB-043	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-044	CAN-044	JOB-044	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-045	CAN-045	JOB-045	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-046	CAN-046	JOB-046	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-047	CAN-047	JOB-047	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-048	CAN-048	JOB-048	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-049	CAN-049	JOB-049	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-050	CAN-050	JOB-050	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-051	CAN-051	JOB-051	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-052	CAN-052	JOB-052	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-053	CAN-053	JOB-053	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-054	CAN-054	JOB-054	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-055	CAN-055	JOB-055	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-056	CAN-056	JOB-056	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-057	CAN-057	JOB-057	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-058	CAN-058	JOB-058	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-059	CAN-059	JOB-059	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-060	CAN-060	JOB-060	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-061	CAN-061	JOB-061	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-062	CAN-062	JOB-062	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-063	CAN-063	JOB-063	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-064	CAN-064	JOB-064	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-065	CAN-065	JOB-065	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-066	CAN-066	JOB-066	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-067	CAN-067	JOB-067	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-068	CAN-068	JOB-068	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-069	CAN-069	JOB-069	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-070	CAN-070	JOB-070	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-071	CAN-071	JOB-071	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-072	CAN-072	JOB-072	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-073	CAN-073	JOB-073	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-074	CAN-074	JOB-074	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-075	CAN-075	JOB-075	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-076	CAN-076	JOB-076	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-077	CAN-077	JOB-077	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-078	CAN-078	JOB-078	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-079	CAN-079	JOB-079	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-080	CAN-080	JOB-080	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-081	CAN-081	JOB-081	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-082	CAN-082	JOB-082	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-083	CAN-083	JOB-083	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-084	CAN-084	JOB-084	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-085	CAN-085	JOB-085	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-086	CAN-086	JOB-086	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-087	CAN-087	JOB-087	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-088	CAN-088	JOB-088	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-089	CAN-089	JOB-089	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-090	CAN-090	JOB-090	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-091	CAN-091	JOB-091	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-092	CAN-092	JOB-092	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-093	CAN-093	JOB-093	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-094	CAN-094	JOB-094	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-095	CAN-095	JOB-095	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-096	CAN-096	JOB-096	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-097	CAN-097	JOB-097	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-098	CAN-098	JOB-098	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-099	CAN-099	JOB-099	RES-01	2026-10-27 09:15:59.971905	Applied	f
APP-100	CAN-100	JOB-100	RES-01	2026-10-27 09:15:59.971905	Applied	f
\.


--
-- Data for Name: screening_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.screening_question (jobid, questionid, questiontext, questiontype) FROM stdin;
JOB-001	Q-01	Years of experience in SQL?	Text
JOB-002	Q-01	Years of experience in SQL?	Text
JOB-003	Q-01	Years of experience in SQL?	Text
JOB-004	Q-01	Years of experience in SQL?	Text
JOB-005	Q-01	Years of experience in SQL?	Text
JOB-006	Q-01	Years of experience in SQL?	Text
JOB-007	Q-01	Years of experience in SQL?	Text
JOB-008	Q-01	Years of experience in SQL?	Text
JOB-009	Q-01	Years of experience in SQL?	Text
JOB-010	Q-01	Years of experience in SQL?	Text
JOB-011	Q-01	Years of experience in SQL?	Text
JOB-012	Q-01	Years of experience in SQL?	Text
JOB-013	Q-01	Years of experience in SQL?	Text
JOB-014	Q-01	Years of experience in SQL?	Text
JOB-015	Q-01	Years of experience in SQL?	Text
JOB-016	Q-01	Years of experience in SQL?	Text
JOB-017	Q-01	Years of experience in SQL?	Text
JOB-018	Q-01	Years of experience in SQL?	Text
JOB-019	Q-01	Years of experience in SQL?	Text
JOB-020	Q-01	Years of experience in SQL?	Text
JOB-021	Q-01	Years of experience in SQL?	Text
JOB-022	Q-01	Years of experience in SQL?	Text
JOB-023	Q-01	Years of experience in SQL?	Text
JOB-024	Q-01	Years of experience in SQL?	Text
JOB-025	Q-01	Years of experience in SQL?	Text
JOB-026	Q-01	Years of experience in SQL?	Text
JOB-027	Q-01	Years of experience in SQL?	Text
JOB-028	Q-01	Years of experience in SQL?	Text
JOB-029	Q-01	Years of experience in SQL?	Text
JOB-030	Q-01	Years of experience in SQL?	Text
JOB-031	Q-01	Years of experience in SQL?	Text
JOB-032	Q-01	Years of experience in SQL?	Text
JOB-033	Q-01	Years of experience in SQL?	Text
JOB-034	Q-01	Years of experience in SQL?	Text
JOB-035	Q-01	Years of experience in SQL?	Text
JOB-036	Q-01	Years of experience in SQL?	Text
JOB-037	Q-01	Years of experience in SQL?	Text
JOB-038	Q-01	Years of experience in SQL?	Text
JOB-039	Q-01	Years of experience in SQL?	Text
JOB-040	Q-01	Years of experience in SQL?	Text
JOB-041	Q-01	Years of experience in SQL?	Text
JOB-042	Q-01	Years of experience in SQL?	Text
JOB-043	Q-01	Years of experience in SQL?	Text
JOB-044	Q-01	Years of experience in SQL?	Text
JOB-045	Q-01	Years of experience in SQL?	Text
JOB-046	Q-01	Years of experience in SQL?	Text
JOB-047	Q-01	Years of experience in SQL?	Text
JOB-048	Q-01	Years of experience in SQL?	Text
JOB-049	Q-01	Years of experience in SQL?	Text
JOB-050	Q-01	Years of experience in SQL?	Text
JOB-051	Q-01	Years of experience in SQL?	Text
JOB-052	Q-01	Years of experience in SQL?	Text
JOB-053	Q-01	Years of experience in SQL?	Text
JOB-054	Q-01	Years of experience in SQL?	Text
JOB-055	Q-01	Years of experience in SQL?	Text
JOB-056	Q-01	Years of experience in SQL?	Text
JOB-057	Q-01	Years of experience in SQL?	Text
JOB-058	Q-01	Years of experience in SQL?	Text
JOB-059	Q-01	Years of experience in SQL?	Text
JOB-060	Q-01	Years of experience in SQL?	Text
JOB-061	Q-01	Years of experience in SQL?	Text
JOB-062	Q-01	Years of experience in SQL?	Text
JOB-063	Q-01	Years of experience in SQL?	Text
JOB-064	Q-01	Years of experience in SQL?	Text
JOB-065	Q-01	Years of experience in SQL?	Text
JOB-066	Q-01	Years of experience in SQL?	Text
JOB-067	Q-01	Years of experience in SQL?	Text
JOB-068	Q-01	Years of experience in SQL?	Text
JOB-069	Q-01	Years of experience in SQL?	Text
JOB-070	Q-01	Years of experience in SQL?	Text
JOB-071	Q-01	Years of experience in SQL?	Text
JOB-072	Q-01	Years of experience in SQL?	Text
JOB-073	Q-01	Years of experience in SQL?	Text
JOB-074	Q-01	Years of experience in SQL?	Text
JOB-075	Q-01	Years of experience in SQL?	Text
JOB-076	Q-01	Years of experience in SQL?	Text
JOB-077	Q-01	Years of experience in SQL?	Text
JOB-078	Q-01	Years of experience in SQL?	Text
JOB-079	Q-01	Years of experience in SQL?	Text
JOB-080	Q-01	Years of experience in SQL?	Text
JOB-081	Q-01	Years of experience in SQL?	Text
JOB-082	Q-01	Years of experience in SQL?	Text
JOB-083	Q-01	Years of experience in SQL?	Text
JOB-084	Q-01	Years of experience in SQL?	Text
JOB-085	Q-01	Years of experience in SQL?	Text
JOB-086	Q-01	Years of experience in SQL?	Text
JOB-087	Q-01	Years of experience in SQL?	Text
JOB-088	Q-01	Years of experience in SQL?	Text
JOB-089	Q-01	Years of experience in SQL?	Text
JOB-090	Q-01	Years of experience in SQL?	Text
JOB-091	Q-01	Years of experience in SQL?	Text
JOB-092	Q-01	Years of experience in SQL?	Text
JOB-093	Q-01	Years of experience in SQL?	Text
JOB-094	Q-01	Years of experience in SQL?	Text
JOB-095	Q-01	Years of experience in SQL?	Text
JOB-096	Q-01	Years of experience in SQL?	Text
JOB-097	Q-01	Years of experience in SQL?	Text
JOB-098	Q-01	Years of experience in SQL?	Text
JOB-099	Q-01	Years of experience in SQL?	Text
JOB-100	Q-01	Years of experience in SQL?	Text
\.


--
-- Data for Name: application_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_answer (applicationid, jobid, questionid, answertext, answeredat) FROM stdin;
APP-001	JOB-001	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-002	JOB-002	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-003	JOB-003	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-004	JOB-004	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-005	JOB-005	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-006	JOB-006	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-007	JOB-007	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-008	JOB-008	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-009	JOB-009	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-010	JOB-010	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-011	JOB-011	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-012	JOB-012	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-013	JOB-013	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-014	JOB-014	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-015	JOB-015	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-016	JOB-016	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-017	JOB-017	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-018	JOB-018	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-019	JOB-019	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-020	JOB-020	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-021	JOB-021	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-022	JOB-022	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-023	JOB-023	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-024	JOB-024	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-025	JOB-025	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-026	JOB-026	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-027	JOB-027	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-028	JOB-028	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-029	JOB-029	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-030	JOB-030	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-031	JOB-031	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-032	JOB-032	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-033	JOB-033	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-034	JOB-034	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-035	JOB-035	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-036	JOB-036	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-037	JOB-037	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-038	JOB-038	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-039	JOB-039	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-040	JOB-040	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-041	JOB-041	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-042	JOB-042	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-043	JOB-043	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-044	JOB-044	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-045	JOB-045	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-046	JOB-046	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-047	JOB-047	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-048	JOB-048	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-049	JOB-049	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-050	JOB-050	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-051	JOB-051	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-052	JOB-052	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-053	JOB-053	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-054	JOB-054	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-055	JOB-055	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-056	JOB-056	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-057	JOB-057	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-058	JOB-058	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-059	JOB-059	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-060	JOB-060	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-061	JOB-061	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-062	JOB-062	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-063	JOB-063	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-064	JOB-064	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-065	JOB-065	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-066	JOB-066	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-067	JOB-067	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-068	JOB-068	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-069	JOB-069	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-070	JOB-070	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-071	JOB-071	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-072	JOB-072	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-073	JOB-073	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-074	JOB-074	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-075	JOB-075	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-076	JOB-076	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-077	JOB-077	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-078	JOB-078	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-079	JOB-079	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-080	JOB-080	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-081	JOB-081	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-082	JOB-082	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-083	JOB-083	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-084	JOB-084	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-085	JOB-085	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-086	JOB-086	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-087	JOB-087	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-088	JOB-088	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-089	JOB-089	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-090	JOB-090	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-091	JOB-091	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-092	JOB-092	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-093	JOB-093	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-094	JOB-094	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-095	JOB-095	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-096	JOB-096	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-097	JOB-097	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-098	JOB-098	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-099	JOB-099	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
APP-100	JOB-100	Q-01	I have 2 years of experience.	2026-10-27 09:15:59.971905
\.


--
-- Data for Name: skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skill (skillid, skillname, category) FROM stdin;
SKL-001	Technology Skill 1	Frontend
SKL-002	Technology Skill 2	Database
SKL-003	Technology Skill 3	Backend
SKL-004	Technology Skill 4	Frontend
SKL-005	Technology Skill 5	Database
SKL-006	Technology Skill 6	Backend
SKL-007	Technology Skill 7	Frontend
SKL-008	Technology Skill 8	Database
SKL-009	Technology Skill 9	Backend
SKL-010	Technology Skill 10	Frontend
SKL-011	Technology Skill 11	Database
SKL-012	Technology Skill 12	Backend
SKL-013	Technology Skill 13	Frontend
SKL-014	Technology Skill 14	Database
SKL-015	Technology Skill 15	Backend
SKL-016	Technology Skill 16	Frontend
SKL-017	Technology Skill 17	Database
SKL-018	Technology Skill 18	Backend
SKL-019	Technology Skill 19	Frontend
SKL-020	Technology Skill 20	Database
SKL-021	Technology Skill 21	Backend
SKL-022	Technology Skill 22	Frontend
SKL-023	Technology Skill 23	Database
SKL-024	Technology Skill 24	Backend
SKL-025	Technology Skill 25	Frontend
SKL-026	Technology Skill 26	Database
SKL-027	Technology Skill 27	Backend
SKL-028	Technology Skill 28	Frontend
SKL-029	Technology Skill 29	Database
SKL-030	Technology Skill 30	Backend
SKL-031	Technology Skill 31	Frontend
SKL-032	Technology Skill 32	Database
SKL-033	Technology Skill 33	Backend
SKL-034	Technology Skill 34	Frontend
SKL-035	Technology Skill 35	Database
SKL-036	Technology Skill 36	Backend
SKL-037	Technology Skill 37	Frontend
SKL-038	Technology Skill 38	Database
SKL-039	Technology Skill 39	Backend
SKL-040	Technology Skill 40	Frontend
SKL-041	Technology Skill 41	Database
SKL-042	Technology Skill 42	Backend
SKL-043	Technology Skill 43	Frontend
SKL-044	Technology Skill 44	Database
SKL-045	Technology Skill 45	Backend
SKL-046	Technology Skill 46	Frontend
SKL-047	Technology Skill 47	Database
SKL-048	Technology Skill 48	Backend
SKL-049	Technology Skill 49	Frontend
SKL-050	Technology Skill 50	Database
SKL-051	Technology Skill 51	Backend
SKL-052	Technology Skill 52	Frontend
SKL-053	Technology Skill 53	Database
SKL-054	Technology Skill 54	Backend
SKL-055	Technology Skill 55	Frontend
SKL-056	Technology Skill 56	Database
SKL-057	Technology Skill 57	Backend
SKL-058	Technology Skill 58	Frontend
SKL-059	Technology Skill 59	Database
SKL-060	Technology Skill 60	Backend
SKL-061	Technology Skill 61	Frontend
SKL-062	Technology Skill 62	Database
SKL-063	Technology Skill 63	Backend
SKL-064	Technology Skill 64	Frontend
SKL-065	Technology Skill 65	Database
SKL-066	Technology Skill 66	Backend
SKL-067	Technology Skill 67	Frontend
SKL-068	Technology Skill 68	Database
SKL-069	Technology Skill 69	Backend
SKL-070	Technology Skill 70	Frontend
SKL-071	Technology Skill 71	Database
SKL-072	Technology Skill 72	Backend
SKL-073	Technology Skill 73	Frontend
SKL-074	Technology Skill 74	Database
SKL-075	Technology Skill 75	Backend
SKL-076	Technology Skill 76	Frontend
SKL-077	Technology Skill 77	Database
SKL-078	Technology Skill 78	Backend
SKL-079	Technology Skill 79	Frontend
SKL-080	Technology Skill 80	Database
SKL-081	Technology Skill 81	Backend
SKL-082	Technology Skill 82	Frontend
SKL-083	Technology Skill 83	Database
SKL-084	Technology Skill 84	Backend
SKL-085	Technology Skill 85	Frontend
SKL-086	Technology Skill 86	Database
SKL-087	Technology Skill 87	Backend
SKL-088	Technology Skill 88	Frontend
SKL-089	Technology Skill 89	Database
SKL-090	Technology Skill 90	Backend
SKL-091	Technology Skill 91	Frontend
SKL-092	Technology Skill 92	Database
SKL-093	Technology Skill 93	Backend
SKL-094	Technology Skill 94	Frontend
SKL-095	Technology Skill 95	Database
SKL-096	Technology Skill 96	Backend
SKL-097	Technology Skill 97	Frontend
SKL-098	Technology Skill 98	Database
SKL-099	Technology Skill 99	Backend
SKL-100	Technology Skill 100	Frontend
\.


--
-- Data for Name: candidate_skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.candidate_skill (candidateid, skillid, proficiencylevel, yearsofexperience) FROM stdin;
CAN-001	SKL-001	Advanced	2
CAN-002	SKL-002	Advanced	2
CAN-003	SKL-003	Advanced	2
CAN-004	SKL-004	Advanced	2
CAN-005	SKL-005	Advanced	2
CAN-006	SKL-006	Advanced	2
CAN-007	SKL-007	Advanced	2
CAN-008	SKL-008	Advanced	2
CAN-009	SKL-009	Advanced	2
CAN-010	SKL-010	Advanced	2
CAN-011	SKL-011	Advanced	2
CAN-012	SKL-012	Advanced	2
CAN-013	SKL-013	Advanced	2
CAN-014	SKL-014	Advanced	2
CAN-015	SKL-015	Advanced	2
CAN-016	SKL-016	Advanced	2
CAN-017	SKL-017	Advanced	2
CAN-018	SKL-018	Advanced	2
CAN-019	SKL-019	Advanced	2
CAN-020	SKL-020	Advanced	2
CAN-021	SKL-021	Advanced	2
CAN-022	SKL-022	Advanced	2
CAN-023	SKL-023	Advanced	2
CAN-024	SKL-024	Advanced	2
CAN-025	SKL-025	Advanced	2
CAN-026	SKL-026	Advanced	2
CAN-027	SKL-027	Advanced	2
CAN-028	SKL-028	Advanced	2
CAN-029	SKL-029	Advanced	2
CAN-030	SKL-030	Advanced	2
CAN-031	SKL-031	Advanced	2
CAN-032	SKL-032	Advanced	2
CAN-033	SKL-033	Advanced	2
CAN-034	SKL-034	Advanced	2
CAN-035	SKL-035	Advanced	2
CAN-036	SKL-036	Advanced	2
CAN-037	SKL-037	Advanced	2
CAN-038	SKL-038	Advanced	2
CAN-039	SKL-039	Advanced	2
CAN-040	SKL-040	Advanced	2
CAN-041	SKL-041	Advanced	2
CAN-042	SKL-042	Advanced	2
CAN-043	SKL-043	Advanced	2
CAN-044	SKL-044	Advanced	2
CAN-045	SKL-045	Advanced	2
CAN-046	SKL-046	Advanced	2
CAN-047	SKL-047	Advanced	2
CAN-048	SKL-048	Advanced	2
CAN-049	SKL-049	Advanced	2
CAN-050	SKL-050	Advanced	2
CAN-051	SKL-051	Advanced	2
CAN-052	SKL-052	Advanced	2
CAN-053	SKL-053	Advanced	2
CAN-054	SKL-054	Advanced	2
CAN-055	SKL-055	Advanced	2
CAN-056	SKL-056	Advanced	2
CAN-057	SKL-057	Advanced	2
CAN-058	SKL-058	Advanced	2
CAN-059	SKL-059	Advanced	2
CAN-060	SKL-060	Advanced	2
CAN-061	SKL-061	Advanced	2
CAN-062	SKL-062	Advanced	2
CAN-063	SKL-063	Advanced	2
CAN-064	SKL-064	Advanced	2
CAN-065	SKL-065	Advanced	2
CAN-066	SKL-066	Advanced	2
CAN-067	SKL-067	Advanced	2
CAN-068	SKL-068	Advanced	2
CAN-069	SKL-069	Advanced	2
CAN-070	SKL-070	Advanced	2
CAN-071	SKL-071	Advanced	2
CAN-072	SKL-072	Advanced	2
CAN-073	SKL-073	Advanced	2
CAN-074	SKL-074	Advanced	2
CAN-075	SKL-075	Advanced	2
CAN-076	SKL-076	Advanced	2
CAN-077	SKL-077	Advanced	2
CAN-078	SKL-078	Advanced	2
CAN-079	SKL-079	Advanced	2
CAN-080	SKL-080	Advanced	2
CAN-081	SKL-081	Advanced	2
CAN-082	SKL-082	Advanced	2
CAN-083	SKL-083	Advanced	2
CAN-084	SKL-084	Advanced	2
CAN-085	SKL-085	Advanced	2
CAN-086	SKL-086	Advanced	2
CAN-087	SKL-087	Advanced	2
CAN-088	SKL-088	Advanced	2
CAN-089	SKL-089	Advanced	2
CAN-090	SKL-090	Advanced	2
CAN-091	SKL-091	Advanced	2
CAN-092	SKL-092	Advanced	2
CAN-093	SKL-093	Advanced	2
CAN-094	SKL-094	Advanced	2
CAN-095	SKL-095	Advanced	2
CAN-096	SKL-096	Advanced	2
CAN-097	SKL-097	Advanced	2
CAN-098	SKL-098	Advanced	2
CAN-099	SKL-099	Advanced	2
CAN-100	SKL-100	Advanced	2
\.


--
-- Data for Name: education; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.education (candidateid, educationid, institution, degree, fieldofstudy, startdate, enddate, gpa) FROM stdin;
CAN-001	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-002	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-003	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-004	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-005	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-006	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-007	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-008	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-009	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-010	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-011	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-012	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-013	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-014	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-015	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-016	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-017	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-018	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-019	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-020	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-021	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-022	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-023	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-024	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-025	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-026	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-027	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-028	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-029	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-030	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-031	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-032	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-033	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-034	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-035	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-036	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-037	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-038	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-039	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-040	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-041	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-042	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-043	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-044	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-045	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-046	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-047	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-048	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-049	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-050	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-051	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-052	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-053	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-054	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-055	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-056	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-057	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-058	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-059	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-060	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-061	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-062	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-063	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-064	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-065	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-066	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-067	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-068	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-069	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-070	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-071	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-072	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-073	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-074	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-075	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-076	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-077	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-078	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-079	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-080	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-081	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-082	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-083	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-084	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-085	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-086	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-087	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-088	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-089	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-090	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-091	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-092	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-093	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-094	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-095	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-096	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-097	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-098	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-099	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
CAN-100	EDU-01	DA-IICT	B.Tech	Mathematics and Computing	2025-08-01	2029-05-31	8.50
\.


--
-- Data for Name: employer_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employer_user (employerid, userid, name, email, role) FROM stdin;
EMP-001	USR-01	Recruiter Admin 1	admin1@company.com	Admin
EMP-002	USR-01	Recruiter Admin 2	admin2@company.com	Admin
EMP-003	USR-01	Recruiter Admin 3	admin3@company.com	Admin
EMP-004	USR-01	Recruiter Admin 4	admin4@company.com	Admin
EMP-005	USR-01	Recruiter Admin 5	admin5@company.com	Admin
EMP-006	USR-01	Recruiter Admin 6	admin6@company.com	Admin
EMP-007	USR-01	Recruiter Admin 7	admin7@company.com	Admin
EMP-008	USR-01	Recruiter Admin 8	admin8@company.com	Admin
EMP-009	USR-01	Recruiter Admin 9	admin9@company.com	Admin
EMP-010	USR-01	Recruiter Admin 10	admin10@company.com	Admin
EMP-011	USR-01	Recruiter Admin 11	admin11@company.com	Admin
EMP-012	USR-01	Recruiter Admin 12	admin12@company.com	Admin
EMP-013	USR-01	Recruiter Admin 13	admin13@company.com	Admin
EMP-014	USR-01	Recruiter Admin 14	admin14@company.com	Admin
EMP-015	USR-01	Recruiter Admin 15	admin15@company.com	Admin
EMP-016	USR-01	Recruiter Admin 16	admin16@company.com	Admin
EMP-017	USR-01	Recruiter Admin 17	admin17@company.com	Admin
EMP-018	USR-01	Recruiter Admin 18	admin18@company.com	Admin
EMP-019	USR-01	Recruiter Admin 19	admin19@company.com	Admin
EMP-020	USR-01	Recruiter Admin 20	admin20@company.com	Admin
EMP-021	USR-01	Recruiter Admin 21	admin21@company.com	Admin
EMP-022	USR-01	Recruiter Admin 22	admin22@company.com	Admin
EMP-023	USR-01	Recruiter Admin 23	admin23@company.com	Admin
EMP-024	USR-01	Recruiter Admin 24	admin24@company.com	Admin
EMP-025	USR-01	Recruiter Admin 25	admin25@company.com	Admin
EMP-026	USR-01	Recruiter Admin 26	admin26@company.com	Admin
EMP-027	USR-01	Recruiter Admin 27	admin27@company.com	Admin
EMP-028	USR-01	Recruiter Admin 28	admin28@company.com	Admin
EMP-029	USR-01	Recruiter Admin 29	admin29@company.com	Admin
EMP-030	USR-01	Recruiter Admin 30	admin30@company.com	Admin
EMP-031	USR-01	Recruiter Admin 31	admin31@company.com	Admin
EMP-032	USR-01	Recruiter Admin 32	admin32@company.com	Admin
EMP-033	USR-01	Recruiter Admin 33	admin33@company.com	Admin
EMP-034	USR-01	Recruiter Admin 34	admin34@company.com	Admin
EMP-035	USR-01	Recruiter Admin 35	admin35@company.com	Admin
EMP-036	USR-01	Recruiter Admin 36	admin36@company.com	Admin
EMP-037	USR-01	Recruiter Admin 37	admin37@company.com	Admin
EMP-038	USR-01	Recruiter Admin 38	admin38@company.com	Admin
EMP-039	USR-01	Recruiter Admin 39	admin39@company.com	Admin
EMP-040	USR-01	Recruiter Admin 40	admin40@company.com	Admin
EMP-041	USR-01	Recruiter Admin 41	admin41@company.com	Admin
EMP-042	USR-01	Recruiter Admin 42	admin42@company.com	Admin
EMP-043	USR-01	Recruiter Admin 43	admin43@company.com	Admin
EMP-044	USR-01	Recruiter Admin 44	admin44@company.com	Admin
EMP-045	USR-01	Recruiter Admin 45	admin45@company.com	Admin
EMP-046	USR-01	Recruiter Admin 46	admin46@company.com	Admin
EMP-047	USR-01	Recruiter Admin 47	admin47@company.com	Admin
EMP-048	USR-01	Recruiter Admin 48	admin48@company.com	Admin
EMP-049	USR-01	Recruiter Admin 49	admin49@company.com	Admin
EMP-050	USR-01	Recruiter Admin 50	admin50@company.com	Admin
EMP-051	USR-01	Recruiter Admin 51	admin51@company.com	Admin
EMP-052	USR-01	Recruiter Admin 52	admin52@company.com	Admin
EMP-053	USR-01	Recruiter Admin 53	admin53@company.com	Admin
EMP-054	USR-01	Recruiter Admin 54	admin54@company.com	Admin
EMP-055	USR-01	Recruiter Admin 55	admin55@company.com	Admin
EMP-056	USR-01	Recruiter Admin 56	admin56@company.com	Admin
EMP-057	USR-01	Recruiter Admin 57	admin57@company.com	Admin
EMP-058	USR-01	Recruiter Admin 58	admin58@company.com	Admin
EMP-059	USR-01	Recruiter Admin 59	admin59@company.com	Admin
EMP-060	USR-01	Recruiter Admin 60	admin60@company.com	Admin
EMP-061	USR-01	Recruiter Admin 61	admin61@company.com	Admin
EMP-062	USR-01	Recruiter Admin 62	admin62@company.com	Admin
EMP-063	USR-01	Recruiter Admin 63	admin63@company.com	Admin
EMP-064	USR-01	Recruiter Admin 64	admin64@company.com	Admin
EMP-065	USR-01	Recruiter Admin 65	admin65@company.com	Admin
EMP-066	USR-01	Recruiter Admin 66	admin66@company.com	Admin
EMP-067	USR-01	Recruiter Admin 67	admin67@company.com	Admin
EMP-068	USR-01	Recruiter Admin 68	admin68@company.com	Admin
EMP-069	USR-01	Recruiter Admin 69	admin69@company.com	Admin
EMP-070	USR-01	Recruiter Admin 70	admin70@company.com	Admin
EMP-071	USR-01	Recruiter Admin 71	admin71@company.com	Admin
EMP-072	USR-01	Recruiter Admin 72	admin72@company.com	Admin
EMP-073	USR-01	Recruiter Admin 73	admin73@company.com	Admin
EMP-074	USR-01	Recruiter Admin 74	admin74@company.com	Admin
EMP-075	USR-01	Recruiter Admin 75	admin75@company.com	Admin
EMP-076	USR-01	Recruiter Admin 76	admin76@company.com	Admin
EMP-077	USR-01	Recruiter Admin 77	admin77@company.com	Admin
EMP-078	USR-01	Recruiter Admin 78	admin78@company.com	Admin
EMP-079	USR-01	Recruiter Admin 79	admin79@company.com	Admin
EMP-080	USR-01	Recruiter Admin 80	admin80@company.com	Admin
EMP-081	USR-01	Recruiter Admin 81	admin81@company.com	Admin
EMP-082	USR-01	Recruiter Admin 82	admin82@company.com	Admin
EMP-083	USR-01	Recruiter Admin 83	admin83@company.com	Admin
EMP-084	USR-01	Recruiter Admin 84	admin84@company.com	Admin
EMP-085	USR-01	Recruiter Admin 85	admin85@company.com	Admin
EMP-086	USR-01	Recruiter Admin 86	admin86@company.com	Admin
EMP-087	USR-01	Recruiter Admin 87	admin87@company.com	Admin
EMP-088	USR-01	Recruiter Admin 88	admin88@company.com	Admin
EMP-089	USR-01	Recruiter Admin 89	admin89@company.com	Admin
EMP-090	USR-01	Recruiter Admin 90	admin90@company.com	Admin
EMP-091	USR-01	Recruiter Admin 91	admin91@company.com	Admin
EMP-092	USR-01	Recruiter Admin 92	admin92@company.com	Admin
EMP-093	USR-01	Recruiter Admin 93	admin93@company.com	Admin
EMP-094	USR-01	Recruiter Admin 94	admin94@company.com	Admin
EMP-095	USR-01	Recruiter Admin 95	admin95@company.com	Admin
EMP-096	USR-01	Recruiter Admin 96	admin96@company.com	Admin
EMP-097	USR-01	Recruiter Admin 97	admin97@company.com	Admin
EMP-098	USR-01	Recruiter Admin 98	admin98@company.com	Admin
EMP-099	USR-01	Recruiter Admin 99	admin99@company.com	Admin
EMP-100	USR-01	Recruiter Admin 100	admin100@company.com	Admin
\.


--
-- Data for Name: employment_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employment_history (candidateid, historyid, previouscompanyname, jobtitle, startdate, enddate, description) FROM stdin;
CAN-001	HIST-01	Tech Startup 1	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-002	HIST-01	Tech Startup 2	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-003	HIST-01	Tech Startup 3	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-004	HIST-01	Tech Startup 4	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-005	HIST-01	Tech Startup 5	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-006	HIST-01	Tech Startup 6	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-007	HIST-01	Tech Startup 7	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-008	HIST-01	Tech Startup 8	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-009	HIST-01	Tech Startup 9	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-010	HIST-01	Tech Startup 10	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-011	HIST-01	Tech Startup 11	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-012	HIST-01	Tech Startup 12	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-013	HIST-01	Tech Startup 13	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-014	HIST-01	Tech Startup 14	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-015	HIST-01	Tech Startup 15	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-016	HIST-01	Tech Startup 16	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-017	HIST-01	Tech Startup 17	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-018	HIST-01	Tech Startup 18	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-019	HIST-01	Tech Startup 19	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-020	HIST-01	Tech Startup 20	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-021	HIST-01	Tech Startup 21	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-022	HIST-01	Tech Startup 22	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-023	HIST-01	Tech Startup 23	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-024	HIST-01	Tech Startup 24	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-025	HIST-01	Tech Startup 25	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-026	HIST-01	Tech Startup 26	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-027	HIST-01	Tech Startup 27	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-028	HIST-01	Tech Startup 28	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-029	HIST-01	Tech Startup 29	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-030	HIST-01	Tech Startup 30	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-031	HIST-01	Tech Startup 31	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-032	HIST-01	Tech Startup 32	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-033	HIST-01	Tech Startup 33	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-034	HIST-01	Tech Startup 34	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-035	HIST-01	Tech Startup 35	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-036	HIST-01	Tech Startup 36	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-037	HIST-01	Tech Startup 37	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-038	HIST-01	Tech Startup 38	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-039	HIST-01	Tech Startup 39	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-040	HIST-01	Tech Startup 40	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-041	HIST-01	Tech Startup 41	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-042	HIST-01	Tech Startup 42	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-043	HIST-01	Tech Startup 43	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-044	HIST-01	Tech Startup 44	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-045	HIST-01	Tech Startup 45	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-046	HIST-01	Tech Startup 46	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-047	HIST-01	Tech Startup 47	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-048	HIST-01	Tech Startup 48	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-049	HIST-01	Tech Startup 49	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-050	HIST-01	Tech Startup 50	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-051	HIST-01	Tech Startup 51	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-052	HIST-01	Tech Startup 52	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-053	HIST-01	Tech Startup 53	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-054	HIST-01	Tech Startup 54	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-055	HIST-01	Tech Startup 55	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-056	HIST-01	Tech Startup 56	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-057	HIST-01	Tech Startup 57	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-058	HIST-01	Tech Startup 58	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-059	HIST-01	Tech Startup 59	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-060	HIST-01	Tech Startup 60	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-061	HIST-01	Tech Startup 61	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-062	HIST-01	Tech Startup 62	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-063	HIST-01	Tech Startup 63	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-064	HIST-01	Tech Startup 64	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-065	HIST-01	Tech Startup 65	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-066	HIST-01	Tech Startup 66	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-067	HIST-01	Tech Startup 67	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-068	HIST-01	Tech Startup 68	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-069	HIST-01	Tech Startup 69	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-070	HIST-01	Tech Startup 70	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-071	HIST-01	Tech Startup 71	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-072	HIST-01	Tech Startup 72	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-073	HIST-01	Tech Startup 73	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-074	HIST-01	Tech Startup 74	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-075	HIST-01	Tech Startup 75	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-076	HIST-01	Tech Startup 76	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-077	HIST-01	Tech Startup 77	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-078	HIST-01	Tech Startup 78	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-079	HIST-01	Tech Startup 79	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-080	HIST-01	Tech Startup 80	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-081	HIST-01	Tech Startup 81	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-082	HIST-01	Tech Startup 82	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-083	HIST-01	Tech Startup 83	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-084	HIST-01	Tech Startup 84	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-085	HIST-01	Tech Startup 85	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-086	HIST-01	Tech Startup 86	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-087	HIST-01	Tech Startup 87	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-088	HIST-01	Tech Startup 88	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-089	HIST-01	Tech Startup 89	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-090	HIST-01	Tech Startup 90	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-091	HIST-01	Tech Startup 91	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-092	HIST-01	Tech Startup 92	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-093	HIST-01	Tech Startup 93	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-094	HIST-01	Tech Startup 94	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-095	HIST-01	Tech Startup 95	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-096	HIST-01	Tech Startup 96	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-097	HIST-01	Tech Startup 97	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-098	HIST-01	Tech Startup 98	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-099	HIST-01	Tech Startup 99	Intern	2025-05-01	2025-07-31	Developed internal tools.
CAN-100	HIST-01	Tech Startup 100	Intern	2025-05-01	2025-07-31	Developed internal tools.
\.


--
-- Data for Name: job_preference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_preference (candidateid, prefid, targettitle, expectedsalary, preferredworkmodel, availabilitydate) FROM stdin;
CAN-001	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-002	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-003	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-004	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-005	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-006	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-007	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-008	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-009	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-010	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-011	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-012	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-013	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-014	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-015	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-016	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-017	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-018	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-019	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-020	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-021	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-022	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-023	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-024	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-025	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-026	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-027	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-028	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-029	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-030	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-031	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-032	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-033	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-034	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-035	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-036	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-037	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-038	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-039	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-040	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-041	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-042	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-043	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-044	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-045	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-046	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-047	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-048	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-049	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-050	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-051	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-052	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-053	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-054	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-055	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-056	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-057	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-058	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-059	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-060	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-061	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-062	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-063	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-064	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-065	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-066	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-067	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-068	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-069	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-070	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-071	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-072	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-073	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-074	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-075	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-076	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-077	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-078	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-079	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-080	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-081	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-082	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-083	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-084	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-085	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-086	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-087	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-088	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-089	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-090	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-091	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-092	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-093	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-094	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-095	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-096	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-097	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-098	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-099	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
CAN-100	PREF-01	Software Engineer	800000.00	Remote	2026-11-06
\.


--
-- Data for Name: job_skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_skill (jobid, skillid, proficiencylevel, ismandatory) FROM stdin;
JOB-001	SKL-001	Intermediate	t
JOB-002	SKL-002	Intermediate	t
JOB-003	SKL-003	Intermediate	t
JOB-004	SKL-004	Intermediate	t
JOB-005	SKL-005	Intermediate	t
JOB-006	SKL-006	Intermediate	t
JOB-007	SKL-007	Intermediate	t
JOB-008	SKL-008	Intermediate	t
JOB-009	SKL-009	Intermediate	t
JOB-010	SKL-010	Intermediate	t
JOB-011	SKL-011	Intermediate	t
JOB-012	SKL-012	Intermediate	t
JOB-013	SKL-013	Intermediate	t
JOB-014	SKL-014	Intermediate	t
JOB-015	SKL-015	Intermediate	t
JOB-016	SKL-016	Intermediate	t
JOB-017	SKL-017	Intermediate	t
JOB-018	SKL-018	Intermediate	t
JOB-019	SKL-019	Intermediate	t
JOB-020	SKL-020	Intermediate	t
JOB-021	SKL-021	Intermediate	t
JOB-022	SKL-022	Intermediate	t
JOB-023	SKL-023	Intermediate	t
JOB-024	SKL-024	Intermediate	t
JOB-025	SKL-025	Intermediate	t
JOB-026	SKL-026	Intermediate	t
JOB-027	SKL-027	Intermediate	t
JOB-028	SKL-028	Intermediate	t
JOB-029	SKL-029	Intermediate	t
JOB-030	SKL-030	Intermediate	t
JOB-031	SKL-031	Intermediate	t
JOB-032	SKL-032	Intermediate	t
JOB-033	SKL-033	Intermediate	t
JOB-034	SKL-034	Intermediate	t
JOB-035	SKL-035	Intermediate	t
JOB-036	SKL-036	Intermediate	t
JOB-037	SKL-037	Intermediate	t
JOB-038	SKL-038	Intermediate	t
JOB-039	SKL-039	Intermediate	t
JOB-040	SKL-040	Intermediate	t
JOB-041	SKL-041	Intermediate	t
JOB-042	SKL-042	Intermediate	t
JOB-043	SKL-043	Intermediate	t
JOB-044	SKL-044	Intermediate	t
JOB-045	SKL-045	Intermediate	t
JOB-046	SKL-046	Intermediate	t
JOB-047	SKL-047	Intermediate	t
JOB-048	SKL-048	Intermediate	t
JOB-049	SKL-049	Intermediate	t
JOB-050	SKL-050	Intermediate	t
JOB-051	SKL-051	Intermediate	t
JOB-052	SKL-052	Intermediate	t
JOB-053	SKL-053	Intermediate	t
JOB-054	SKL-054	Intermediate	t
JOB-055	SKL-055	Intermediate	t
JOB-056	SKL-056	Intermediate	t
JOB-057	SKL-057	Intermediate	t
JOB-058	SKL-058	Intermediate	t
JOB-059	SKL-059	Intermediate	t
JOB-060	SKL-060	Intermediate	t
JOB-061	SKL-061	Intermediate	t
JOB-062	SKL-062	Intermediate	t
JOB-063	SKL-063	Intermediate	t
JOB-064	SKL-064	Intermediate	t
JOB-065	SKL-065	Intermediate	t
JOB-066	SKL-066	Intermediate	t
JOB-067	SKL-067	Intermediate	t
JOB-068	SKL-068	Intermediate	t
JOB-069	SKL-069	Intermediate	t
JOB-070	SKL-070	Intermediate	t
JOB-071	SKL-071	Intermediate	t
JOB-072	SKL-072	Intermediate	t
JOB-073	SKL-073	Intermediate	t
JOB-074	SKL-074	Intermediate	t
JOB-075	SKL-075	Intermediate	t
JOB-076	SKL-076	Intermediate	t
JOB-077	SKL-077	Intermediate	t
JOB-078	SKL-078	Intermediate	t
JOB-079	SKL-079	Intermediate	t
JOB-080	SKL-080	Intermediate	t
JOB-081	SKL-081	Intermediate	t
JOB-082	SKL-082	Intermediate	t
JOB-083	SKL-083	Intermediate	t
JOB-084	SKL-084	Intermediate	t
JOB-085	SKL-085	Intermediate	t
JOB-086	SKL-086	Intermediate	t
JOB-087	SKL-087	Intermediate	t
JOB-088	SKL-088	Intermediate	t
JOB-089	SKL-089	Intermediate	t
JOB-090	SKL-090	Intermediate	t
JOB-091	SKL-091	Intermediate	t
JOB-092	SKL-092	Intermediate	t
JOB-093	SKL-093	Intermediate	t
JOB-094	SKL-094	Intermediate	t
JOB-095	SKL-095	Intermediate	t
JOB-096	SKL-096	Intermediate	t
JOB-097	SKL-097	Intermediate	t
JOB-098	SKL-098	Intermediate	t
JOB-099	SKL-099	Intermediate	t
JOB-100	SKL-100	Intermediate	t
\.


--
-- PostgreSQL database dump complete
--

\unrestrict uOguWqQ3b35D4m3qBLeF1abEv9cmFII2Bu4RItpgdgzhQ7XYDa2ScNtRZvEZNNj

